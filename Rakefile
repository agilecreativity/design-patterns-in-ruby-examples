require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

namespace :cucumber do
  Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
  end
end

namespace :rspec do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.fail_on_error = false
    t.rspec_opts = "--format documentation --color"
  end
  task default: :spec
end

task default: [ 'rspec:spec']
