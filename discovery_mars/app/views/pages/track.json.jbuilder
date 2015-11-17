  json.bounds @land.bounds
  json.rovers @land.rovers do |rover|
    if rover.valid?
      json.location rover.location
    else
      json.errors rover.errors
    end
  end
  json.errors @land.errors if !@land.valid? && @land.errors[:rovers].empty?

