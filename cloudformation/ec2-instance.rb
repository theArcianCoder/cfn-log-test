require 'cfndsl'
require 'yaml'

puts YAML.dump(
    CloudFormation do
        resource('MyEC2Instance', 'AWS::EC2::Instance') do
          # EC2 instance properties
          Properties do
            property('ImageId', 'ami-12345678')   # Replace with your desired AMI ID
            property('InstanceType', 't2.micro')
            property('KeyName', 'my-keypair')     # Replace with your SSH key pair
          end
        end
    end
)
