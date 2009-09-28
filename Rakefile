# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

namespace :ferret do
desc "Updates the ferret index for the application."
  task :recreate => [ :environment ] do
    puts "Creating index"
    Expert.rebuild_index
    Extra.rebuild_index
    puts "Completed Ferret Index Rebuild"
  end
end