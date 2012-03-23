require 'rubygems'
require 'bundler/setup'
require 'rubygems/package_task'
require 'spec'
require 'spec/rake/spectask'

PLUGIN = "acts_as_commentable_with_threading"
NAME = "acts_as_commentable_with_threading"
GEM_VERSION = "1.0.0"
AUTHOR = "Evan Light"
EMAIL = "evan@tripledogdare.net"
SUMMARY = "Plugin/gem that provides threaded comment functionality"

spec = eval(File.read('acts_as_commentable_with_threading.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**_spec.rb']
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{GEM_VERSION}}
end

task :default => :spec
