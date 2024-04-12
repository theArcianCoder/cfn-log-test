require 'cfndsl'
require 'yaml'

def generate_template
  template = CloudFormation do
    instance_eval(File.read('cloudformation/template.rb'), 'cloudformation/template.rb')
  end

  yaml_template = template.to_yaml
  raise "Error: Generated template is empty." if yaml_template.strip.empty?

  yaml_template
end

# Example usage:
begin
  template_yaml = generate_template
  File.write('template.yaml', template_yaml)
rescue => e
  puts e.message
  exit(1)
end
