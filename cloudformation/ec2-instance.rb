ec2_instance('MyEC2Instance') do
    # EC2 instance configuration
    image_id 'ami-12345678'
    instance_type 't2.micro'
    key_name 'my-keypair'
  end
  