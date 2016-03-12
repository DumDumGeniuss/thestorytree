root = "/var/www/example.com/thestorytree"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.thestorytree.sock"
worker_processes 1
timeout 30
