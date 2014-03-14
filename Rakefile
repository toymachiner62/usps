require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rake'
#require 'spec/rake/spectask'
require "rspec/core/rake_task"

#Spec::Rake::SpecTask.new(:spec) do |spec|
RSpec::Core::RakeTask.new(:spec) do |spec|
  #spec.libs << 'lib' << 'spec'
  #spec.spec_files = FileList['spec/**/*_spec.rb']
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec

desc "Run the certification tests against USPS's API. Requires ENV['USPS_USER'] to be set or passed in."
task :certify do
  ruby "-rubygems -Ilib lib/usps/test.rb"
end
