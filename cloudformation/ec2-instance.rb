require 'cfndsl'

puts YAML.dump(
  CloudFormation do
    ec2_instance('MyEC2Instance') do
      image_id 'ami-12345678'     # Replace with your desired AMI ID
      instance_type 't2.micro'
      key_name 'my-keypair'       # Replace with your SSH key pair
    end
  end
)
