require 'open3'

def deploy_ec2_stack
  command = 'aws cloudformation deploy --template-file cloudformation/ec2-instance.yaml --stack-name my-ec2-stack  --region us-east-1'
  stdout, stderr, status = Open3.capture3(command)
  puts stdout
  puts stderr if status.exitstatus != 0
  return status.exitstatus
end

def describe_stack_events
  command = 'aws cloudformation describe-stack-events --stack-name my-ec2-stack --region us-east-1 > stack-events.json'
  stdout, stderr, status = Open3.capture3(command)
  puts stdout
  puts stderr if status.exitstatus != 0
  return status.exitstatus
end

def print_stack_events
  command = 'cat stack-events.json'
  stdout, stderr, status = Open3.capture3(command)
  puts stdout
  puts stderr if status.exitstatus != 0
  return status.exitstatus
end

def run_pipeline_commands
  exit_code = 0
  exit_code |= deploy_ec2_stack
  exit_code |= describe_stack_events
  exit_code |= print_stack_events
  return exit_code
end

exit(run_pipeline_commands)
