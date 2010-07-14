load_paths.unshift File.expand_path(File.dirname(__FILE__) + '/../vendor/plugins/awesomeness/recipes')

# BACKUP: http://opensoul.org/2007/2/9/automatically-backing-up-your-remote-database-on-deploy
# SOURCES setup users: http://www.viget.com/extend/building-an-environment-from-scratch-with-capistrano-2/
# setup deploy: http://www.capify.org/getting-started/from-the-beginning/


require 'yaml'
GIT = YAML.load_file("#{File.dirname(__FILE__)}/git.yml")

default_run_options[:pty] = true
set :application, "expertxs"
set :deploy_to, "/home/deploy/#{application}"
set :user, "deploy"
set :use_sudo, false

set :scm, "git"
set :repository,  "git@github.com:danigb/expertxs.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_verbose, true # necesario para la version de git de toami
set :scm_passphrase, GIT['password']

# set :git_shallow_clone, 1 #set :git_enable_submodules, 1

role :app, "toami.net"
role :web, "toami.net"
role :db,  "toami.net", :primary => true

after "deploy:update_code", "config:copy_shared_configurations"
after "deploy", "deploy:cleanup"
after "deploy", "deploy:restart"

# Configuration Tasks
namespace :config do
  desc "copy shared configurations to current"
  task :copy_shared_configurations, :roles => [:app] do
    %w[database.yml].each do |f|
      run "ln -nsf #{shared_path}/config/#{f} #{release_path}/config/#{f}"
    end
  end
end


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end


namespace :mysql do
  desc "Backup the remote production database"
  task :backup, :roles => :db, :only => { :primary => true } do
    filename = "#{application}.dump.#{Time.now.to_i}.sql.bz2"
    file = "/tmp/#{filename}"
    on_rollback { delete file }
    db = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), 'database.yml'))).result)['production']
    run "mysqldump -u #{db['username']} --password=#{db['password']} #{db['database']} | bzip2 -c > #{file}"  do |ch, stream, data|
      puts data
    end
    `mkdir -p #{File.dirname(__FILE__)}/../backups/`
    get file, "backups/#{filename}"
    `gpg -c #{File.dirname(__FILE__)}/../backups/#{filename}`
    `rm #{File.dirname(__FILE__)}/../backups/#{filename}`
    # delete file
  end
end

desc "Backup the database before running migrations"
task :before_migrate do
  mysql
end

# http://www.zorched.net/2008/06/19/capistrano-and-ferret-drb/
default_run_options[:shell] = false
namespace :ferret do
  desc "Start ferret server in production mode"
  task :start do
    path = File.join(File.dirname(__FILE__), '..')
    run "#{current_path}/script/ferret_server start -e production --root #{path}"
  end

  desc "Stop ferret server in production mode"
  task :stop do
        path = File.join(File.dirname(__FILE__), '..')
    run "#{current_path}/script/ferret_server stop -e production --root #{path}"
  end

  desc "Re-start ferret server in production mode"
  task :restart do
    stop
    start
  end
end

#before "deploy:start", "ferret:start"
#before "deploy:stop", "ferret:stop"
#after "deploy:restart", "ferret:restart"
