class TimerService
    def initialize
      @start_time = nil
      @elapsed_time = 0
    end
  
    def start
      @start_time = Time.now
    end
  
    def stop
      if @start_time
        @elapsed_time += Time.now - @start_time
        @start_time = nil
      end
    end
  
    def reset
      @start_time = nil
      @elapsed_time = 0
    end
  
    def elapsed_time
      if @start_time
        @elapsed_time + (Time.now - @start_time)
      else
        @elapsed_time
      end
    end
  end