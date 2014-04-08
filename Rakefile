# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require './lib/omniauth-inkdrop/version.rb'
Jeweler::Tasks.new do |gem|
  gem.name        = "omniauth-inkdrop"
  gem.homepage    = "https://github.com/inkdrop/omniauth-inkdrop"
  gem.license     = "MIT"
  gem.summary     = %Q{Inkdrop strategy for OmniAuth.}
  gem.description = %Q{Inkdrop strategy for OmniAuth.}
  gem.email       = "jnwelzel@gmail.com"
  gem.authors     = ["Jonathan Welzel"]
  gem.version     = Omniauth::Inkdrop::VERSION
  gem.files.exclude 'Gemfile.lock', 'omniauth-inkdrop.gemspec'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test
