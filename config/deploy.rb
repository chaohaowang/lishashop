default_run_options[:pty] = true
set :application, "mihoko shop"
set :repository,  "git@github.com:chaohaowang/mihoko-shop.git"
set :scm, "git"
set :scm_passphrase, "64839361" #This is your custom users password
set :user, "chaohaowang"
set :branch, "master"
#set :deploy_via, :remote_cache
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "chaohaowang.oicp.net"
role :web, "chaohaowang.oicp.net"
set :deploy_to, "/home/chaohaowang/mihoko-shop"
set :runner, "chaohaowang"
role :db,  "chaohaowang.oicp.net", :primary => true

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "sudo apache2ctl restart"
  end
end

after :deploy, "passenger:restart"