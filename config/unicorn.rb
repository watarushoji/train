application = 'boobs'
# APP_PATH = File.expand_path('../../', __FILE__)
APP_PATH = "/usr/share/nginx/html/boobs/current"

working_directory 	APP_PATH

stderr_path 		APP_PATH + "/log/unicorn.log"
stdout_path 		APP_PATH + "/log/unicorn.log"

listen 				APP_PATH + "/tmp/unicorn.sock"
pid 				APP_PATH + "/tmp/unicorn.pid"

# listen "/var/run/unicorn_#{application}.sock"   # Unix Domain Socket
# pid "/var/run/unicorn_#{application}.pid"     #PIDファイル出力先
#listen 3000

worker_processes 2
timeout 30
preload_app true

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{APP_PATH}/Gemfile"
end

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{APP_PATH}/tmp/pids/unicorn.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # the following is *required* for Rails + "preload_app true",
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  # if preload_app is true, then you may also want to check and
  # restart any other shared sockets/descriptors such as Memcached,
  # and Redis.  TokyoCabinet file handles are safe to reuse
  # between any number of forked children (assuming your kernel
  # correctly implements pread()/pwrite() system calls)
end