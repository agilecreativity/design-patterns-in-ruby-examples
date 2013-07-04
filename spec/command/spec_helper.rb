dir = File.join(File.dirname(__FILE__), '../../', 'lib','command')
  Dir[File.expand_path("#{dir}/*.rb")].uniq.each do |file|
  require file
end
include Patterns::Command
