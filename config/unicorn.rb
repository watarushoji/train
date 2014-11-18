working_directory "/var/www/html"
pid "/var/www/html/tmp/pids/unicorn.pid"
stderr_path "/var/www/html/log/unicorn.log"
stdout_path "/var/www/html/log/unicorn.log"

listen "/tmp/unicorn.todo.sock"
#listen 3000
worker_processes 2
timeout 30
