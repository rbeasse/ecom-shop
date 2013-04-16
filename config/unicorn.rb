APP_PATH = "/srv/ryan/ecom-shop"

working_directory APP_PATH
pid 							APP_PATH + "/tmp/pid/unicorn.pid"
stderr_path				APP_PATH + "/log/unicorn.log"
stdout_path 			APP_PATH + "/log/unicorn.log"

listen "/tmp/shop.sock"
worker_processes 2
timeout 30