require 'cfndsl'
require 'yaml'

template = CloudFormation do
  resource('MyEC2Instance', 'AWS::EC2::Instance') do
    # EC2 instance properties
    property('ImageId', 'ami-12345678')   # Replace with your desired AMI ID
    property('InstanceType', 't2.micro')
    property('KeyName', 'my-keypair')     # Replace with your SSH key pair
  end
end

puts YAML.dump(template)