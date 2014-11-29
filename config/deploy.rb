# config valid only for Capistrano 3.1
lock '3.2.1'

# ssh_options[:forward_agent] = true

# バージョン管理
set :scm, :git
# Gitリポジトリ
set :repo_url, 'https://github.com/watarushoji/train.git'
# Gitブランチ
set :branch, :master
set :keep_releases, 5

# デプロイ対象外ファイル
set :copy_exclude, [".git", ".gitignore"]

# ---以下http://morizyun.github.io/blog/capistrano3-rails-deploy-multi-rbenv/
set :deploy_to, '/usr/share/nginx/html/boobs'
set :rvm_type, :system
set :rvm1_ruby_version, '2.0.0'
# set :rbenv_type, :system # or :user
# set :rbenv_ruby, '2.1.1'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_roles, :all
# set :application, 'my_app_name'
# set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#From https://github.com/capistrano/rbenv/issues/33

namespace :deploy do
  desc 'Restart application'
  task :restart do
    #invoke 'unicorn:restart'
  end
end
after 'deploy:publishing', 'deploy:restart'