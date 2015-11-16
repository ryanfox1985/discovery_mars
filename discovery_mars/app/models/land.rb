class Land < ActiveRecord::Base

  has_many :rovers

  validates_numericality_of :x, greater_than: 0, only_integer: true
  validates_numericality_of :y, greater_than: 0, only_integer: true


  def bounds
    [self.x, self.y]
  end

  def bounds=value
    self.x = value[0]
    self.y = value[1]
  end

  def self.parse_order_from_text orders
    lines = orders.lines.map(&:chomp)
    
    #Init land
    land_bounds = lines.shift
    bounds = land_bounds.scan(/^(\d+) (\d+)$/)[0]
    land = Land.new_land_from_bounds bounds

    #Create rovers
    lines.each_slice(2) do |rover_lines|
      location = rover_lines[0].downcase.scan(/^(\d+) (\d+) (n|w|e|s)$/)[0]
      location[0] = location[0].to_i
      location[1] = location[1].to_i
      actions = rover_lines[1].downcase.tr('^(l|r|m)','').split("")
      rover = land.new_rover_from_bounds location, actions
      land.rovers << rover
    end

    land
  end

  def self.new_land_from_bounds bounds
    if bounds.length == 2 
      Land.new(bounds: bounds)  
    end
  end

  def new_rover_from_bounds location, actions=[]
    if location.length == 3
      rover = Rover.new(land: self, location: location)
      rover.track actions if actions.present?
      rover
    end
  end

end
