working_directory 	"/usr/share/nginx/html/boobs"
pid 				"/usr/share/nginx/html/boobs/tmp/pids/unicorn.pid"
stderr_path 		"/usr/share/nginx/html/boobs/log/unicorn.log"
stdout_path 		"/usr/share/nginx/html/boobs/log/unicorn.log"

listen 				"/usr/share/nginx/html/boobs/tmp/unicorn.sock"
#listen 3000
worker_processes 2
timeout 30
preload_app true
