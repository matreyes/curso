require "bundler/capistrano"

default_run_options[:pty] = true

set :application, 'curso'
set :branch, "master"
set :scm, :git
set :git_shallow_clone, 1
set :scm_user, 'pasa'
set :use_sudo, false
set :repository, "git://github.com/matreyes/curso.git"
ssh_options[:forward_agent] = true
set :keep_releases, 5

set :deploy_server, '190.54.16.190'
set :user,  'pasa'
set :port, "22"

set(:deploy_to){
  "/home/pasa/curso"
}

role :app, deploy_server
role :web, deploy_server
role :db,  deploy_server, :primary => true

before "db:setup", "deploy:update_code", "bundle:install"
after "deploy:update_code", :symlinks
after "deploy:symlink", :run_migrations
after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:stop"
after "deploy", "deploy:cleanup"

desc "Restart Application"
deploy.task :restart, :roles => [:app] do
  run "touch #{current_path}/tmp/restart.txt"
end

desc "Migraciones"
task :run_migrations, :roles => [:app] do
  run <<-CMD
    export RAILS_ENV=production &&
    cd #{release_path} &&
    rake db:migrate --trace
  CMD
end

task :symlinks, :roles => [:app] do
  run <<-CMD
    ln -s #{shared_path}/system #{release_path}/public/system;
    ln -s #{shared_path}/cache #{release_path}/public/;
    ln -s #{shared_path}/uploads #{release_path}/public/;
  CMD
end

namespace :delayed_job do
  def rails_env
    "RAILS_ENV=production"
  end

  desc "Stop the delayed_job process"
  task :stop, :roles => :app do
    run "cd #{current_path};#{rails_env} script/delayed_job stop"
  end

  desc "Start the delayed_job process"
  task :start, :roles => :app do
    run "cd #{current_path};#{rails_env} script/delayed_job start"
  end

  desc "Restart the delayed_job process"
  task :restart, :roles => :app do
    run "cd #{current_path}; #{rails_env} script/delayed_job restart"
  end
end


