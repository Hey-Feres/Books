set :application, 'Feres_Books'              # Nome da sua aplicação          
set :repo_url, 'https://github.com/Hey-Feres/Books.git'    # Repositório git do seu projeto
set :deploy_to, '/var/www/books'          # Pasta onde a app está localizada
set :branch, 'master'
set :keep_releases, 5
set :format, :airbrussh
set :log_level, :debug
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "storage", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"