require 'aws-sdk-cloudformation'

def deploy_stack(template_file, stack_name, region)
  client = Aws::CloudFormation::Client.new(region: region)
  response = client.create_stack({
    stack_name: stack_name,
    template_body: File.read(template_file)
  })

  # Return the stack ID for reference
  response.stack_id
rescue Aws::CloudFormation::Errors::ServiceError => e
  puts "Error deploying stack: #{e.message}"
  nil
end

def describe_stack_events(stack_name, region)
  client = Aws::CloudFormation::Client.new(region: region)
  response = client.describe_stack_events({
    stack_name: stack_name
  })

  # Print the stack events to the console
  puts "Stack Events for #{stack_name}:"
  response.stack_events.each do |event|
    puts "#{event.event_id}: #{event.logical_resource_id} - #{event.resource_status} - #{event.timestamp}"
  end
rescue Aws::CloudFormation::Errors::ServiceError => e
  puts "Error describing stack events: #{e.message}"
end

def run_pipeline(template_file, stack_name, region)
  # Deploy the CloudFormation stack
  stack_id = deploy_stack(template_file, stack_name, region)

  # Describe stack events if the deployment was successful
  if stack_id
    describe_stack_events(stack_name, region)
  end
end

# Set your template file path, stack name, and region
template_file = 'cloudformation/ec2-instance.yaml'
stack_name = 'my-ec2-stack'
region = 'us-east-1'

# Run the pipeline
run_pipeline(template_file, stack_name, region)
