$LOAD_PATH.unshift 'lib'
require 'capistrano/log_with_awesome/version'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.version = Capistrano::LogWithAwesome::VERSION
    gem.name = "capistrano-log_with_awesome"
    gem.summary = %Q{logging callbacks for capistrano}
    gem.description = %Q{logging callbacks for capistrano}
    gem.email = "jnewland@gmail.com"
    gem.homepage = "http://github.com/jnewland/capistrano-log_with_awesome"
    gem.authors = ["Jesse Newland"]
    gem.add_dependency "capistrano", ">= 2.5.14"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
