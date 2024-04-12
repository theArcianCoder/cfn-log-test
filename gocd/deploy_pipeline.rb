require 'open3'

# Method to deploy the CloudFormation stack
def deploy_ec2_stack
  command = <<-CMD
    aws cloudformation deploy \
      --template-file ec2-instance.yaml \
      --stack-name my-ec2-stack \
      --parameter-overrides "$(jq -r '.[] | "\(.key)=\(.value)"' cloudformation/parameters.json)" \
      --region us-east-1
  CMD
  stdout, stderr, status = Open3.capture3(command)
  puts stdout
  puts stderr if status != 0
  return status
end

# Method to describe stack events and save to a file
def describe_stack_events
  command = 'aws cloudformation describe-stack-events --stack-name my-ec2-stack --region us-east-1 > stack-events.json'
  stdout, stderr, status = Open3.capture3(command)
  puts stdout
  puts stderr if status != 0
  return status
end

# Method to print stack events from the file
def print_stack_events
  command = 'cat stack-events.json'
  stdout, stderr, status = Open3.capture3(command)
  puts stdout
  puts stderr if status != 0
  return status
end

# Method to execute all pipeline commands
def run_pipeline_commands
  exit_code = deploy_ec2_stack
  exit_code ||= describe_stack_events
  exit_code ||= print_stack_events
  return exit_code
end

# Run pipeline commands and exit with combined exit code
exit(run_pipeline_commands.exitstatus)
