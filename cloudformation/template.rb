CloudFormation do
  AWSTemplateFormatVersion "2010-09-09"
  Description "My Stack"

  # Define your CloudFormation resources here
  # Example:
  Resource("MyEC2Instance") do
    Type "AWS::EC2::Instance"
    Property("ImageId", "ami-080e1f13689e07408")   # Replace with your desired AMI ID
    Property("InstanceType", "t2.micro")
    Property("KeyName", "test.pem")     # Replace with your SSH key pair
    # Add other properties as needed
  end
end
