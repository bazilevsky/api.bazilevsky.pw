#========================
#CONFIG
#========================
set :application, "api.bazilevsky.pw"
#========================
#CONFIG
#========================
require           "capistrano-offroad"
offroad_modules   "defaults", "supervisord"
set :repository,  "git@github.com:bazilevsky/#{application}.git"
set :supervisord_start_group, "app"
set :supervisord_stop_group,  "app"
#========================
#ROLES
#========================
set  :gateway,    "#{application}" # main server
role :app,        "10.3.90.1"      # container

after "deploy:create_symlink",
      "deploy:npm_install",
      "deploy:cleanup",
      "deploy:restart"
