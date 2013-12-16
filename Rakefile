require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{GEM_VERSION}}
end

desc 'Default: run specs.'
task :default => :spec
