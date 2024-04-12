require 'cfndsl'
require 'yaml'

puts YAML.dump(
    CloudFormation do
        resource('MyEC2Instance', 'AWS::EC2::Instance') do
          # EC2 instance properties
          Properties do
            ImageId 'ami-12345678'   # Replace with your desired AMI ID
            InstanceType 't2.micro'
            KeyName 'my-keypair'     # Replace with your SSH key pair
          end
        end
    end
)
