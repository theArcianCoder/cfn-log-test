require 'cfndsl'

def generate_template
  template = CloudFormation do
    instance_eval(File.read('cloudformation/template.rb'), 'cloudformation/template.rb')
  end
  template.to_json
end

# Example usage:
template_json = generate_template
File.write('template.json', template_json)
