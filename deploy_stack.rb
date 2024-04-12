require 'json'

def validate_template(template_file)
  # Validate CloudFormation template syntax
  system("aws cloudformation validate-template --template-body file://#{template_file}")
end

def deploy_stack(stack_name, template_file, region)
  # Deploy CloudFormation stack
  system("aws cloudformation deploy --template-file #{template_file} --stack-name #{stack_name} --region #{region}")
end

# Read template parameters from parameters.json
parameters = JSON.parse(File.read('cloudformation/parameters.json'))

# Validate and deploy stack
template_file = 'template.json'
stack_name = 'my-stack'
region = 'us-east-1'

if validate_template(template_file)
  deploy_stack(stack_name, template_file, region)
else
  puts "Error: CloudFormation template validation failed."
end
