class AirTrafficControl
  
  def initialize
    @queue = []
  end

  def system_boot
    @queue = [] # resets the que
  end

  def aircraft_priority
    [
      { type: 'passenger', size: 'large' },
      { type: 'passenger', size: 'small' },
      { type: 'cargo', size: 'large' },
      { type: 'cargo', size: 'small' }
    ]
  end

  def current_queue
    @queue
  end

  def enqeue_aircraft(aircraft)
    @queue << aircraft
  end

  def dequeue_aircraft
    return false if @queue.empty?
    aircraft_priority.each do |p|
      aircraft = @queue.select do |ac|
        ac.type == p[:type] && ac.size == p[:size]
      end
      return aircraft.first unless aircraft.empty?
    end
  end
end
