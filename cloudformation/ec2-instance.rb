require 'cfndsl'
require 'yaml'

template = CloudFormation do
  resource('MyEC2Instance', 'AWS::EC2::Instance') do
    property('ImageId', 'ami-12345678')   # Replace with your desired AMI ID
    property('InstanceType', 'ami-080e1f13689e07408')
    property('KeyName', 'test.pem')     # Replace with your SSH key pair
  end
end

puts YAML.dump(template)