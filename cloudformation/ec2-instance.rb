ec2_instance(name: 'MyEC2Instance') do
    image_id 'ami-12345678'  # Replace with your desired AMI ID
    instance_type 't2.micro'
    key_name 'my-keypair'     # Replace with your SSH key pair
  end