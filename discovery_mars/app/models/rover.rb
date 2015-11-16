class Rover < ActiveRecord::Base
  extend Enumerize

  belongs_to :land

  validates :x, presence: true
  validates :y, presence: true
  validates :way, presence: true
  validates :land, presence: true
  validate  :validate_position

  enumerize :way, in: [:n, :e, :s, :w]

  def position
    [x,y]
  end
  
  def location
    [x,y,way]
  end

  def location=value
    x=value[0]
    y=value[1]
    way=value[2]
  end

  def turn_left
    case way
      when :n
        way = :w
      when :w
        way = :s
      when :s
        way = :e
      when :e
        way = :n
      end
  end

  def turn_right
    case way
      when :n
        way = :e
      when :e
        way = :s
      when :s
        way = :w
      when :w
        way = :n
      end
  end

  def move
    case way
      when :n
        y += 1
      when :e
        x += 1
      when :s
        x -= 1
      when :w
        y -= 1
      end
    validate_position
  end

  def track actions
     


  end

  private

    def validate_position
      raise "position invalid" if x<0 || y<0 || x>self.land.x || y>self.land.y
    end

end
