APP_PATH = "/usr/share/nginx/html/boobs/current"

working_directory 	APP_PATH
pid 				APP_PATH + "/tmp/pids/unicorn.pid"
stderr_path 		APP_PATH + "/log/unicorn.log"
stdout_path 		APP_PATH + "/log/unicorn.log"

listen 				"/tmp/unicorn.sock"
#listen 3000
worker_processes 2
timeout 30
preload_app true
