require 'cfndsl'
require 'yaml'

puts YAML.dump(
    CloudFormation do
        EC2Instance('MyEC2Instance') do
          # EC2 instance configuration
          ImageId 'ami-12345678'   # Replace with your desired AMI ID
          InstanceType 't2.micro'
          KeyName 'my-keypair'     # Replace with your SSH key pair
        end
    end
)
