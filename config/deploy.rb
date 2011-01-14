set :application, "cityserv"
set :repository,  "git@github.com:tcamara/Cityserv.git"
set :branch, 'master'
set :user, 'root'
set :password, '0dysseus4'
set :domain, 'cityserv.org'
set :deploy_to, '/home/cityserv/public_html/cityserv.org/'
set :use_sudo, false
set :port, 100

default_run_options[:pty] = true

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
role :db,  domain

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   
  task :chmod_public_files do
    run "#{try_sudo} chmod 777 #{current_path}/public/images"
    run "#{try_sudo} chmod 777 #{current_path}/public/javascripts"
    run "#{try_sudo} chmod 777 #{current_path}/public/stylesheets"
    run "#{try_sudo} chmod 777 #{current_path}/public/system"
  end
  
  
 end
 

after 'deploy:update_code', 'deploy:chmod_public_files'