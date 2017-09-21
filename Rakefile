#this is 'kind of' like using another bin file, just using a different paradigm

require "bundler/gem_tasks"
require "rspec/core/rake_task"

#do I need this?
#require_relative './config/environment'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
