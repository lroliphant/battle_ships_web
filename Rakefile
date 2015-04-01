require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'rubocop/rake_task'

Cucumber::Rake::Task.new :cuke
RSpec::Core::RakeTask.new :spec
RuboCop::RakeTask.new :cop

task default: [:cop, :spec, :cuke]
