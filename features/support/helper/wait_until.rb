module WaitUntil
  def wait_until
    start_time = Time.now
    begin
      yield
    rescue => e
      raise e if (Time.now - start_time) >= Capybara.default_wait_time
      sleep(0.25)
      print '.'
      retry
    end
  end
end