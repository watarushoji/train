application = 'boobs'
APP_PATH = "/usr/share/nginx/html/boobs/current"

working_directory 	APP_PATH

stderr_path 		APP_PATH + "/log/unicorn.log"
stdout_path 		APP_PATH + "/log/unicorn.log"

listen "/var/run/unicorn_#{application}.sock"   # Unix Domain Socket
pid "/var/run/unicorn_#{application}.pid"     #PIDファイル出力先
#listen 3000

worker_processes 2
timeout 30
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
    if old_pid != server.pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
        Process.kill(sig, File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
      end
    end
 
    sleep 1
  end
 
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end