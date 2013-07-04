dir = File.join(File.dirname(__FILE__), '../../', 'lib','strategy')
  Dir[File.expand_path("#{dir}/*.rb")].uniq.each do |file|
  require file
end
include Patterns::Strategy
