worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 20
preload_app true
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

before_exec do |server|
  ENV['RUBY_HEAP_MIN_SLOTS']=800000
  ENV['RUBY_GC_MALLOC_LIMIT']=90000000
  ENV['RUBY_HEAP_SLOTS_INCREMENT']=10000
  ENV['RUBY_HEAP_SLOTS_GROWTH_FACTOR']=1
  ENV['RUBY_HEAP_FREE_MIN']=100000
end

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.connection.disconnect!
  # EM.stop if defined?(EM) && EM.reactor_running?
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
  ActiveRecord::Base.establish_connection
  # Thread.new { EM.run }
end
