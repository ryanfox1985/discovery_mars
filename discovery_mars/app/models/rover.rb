class Rover < ActiveRecord::Base
  extend Enumerize

  belongs_to :land

  validates_numericality_of :x, greater_than_or_equal_to: 0, only_integer: true
  validates_numericality_of :y, greater_than_or_equal_to: 0, only_integer: true
  validates_presence_of :way
  validates_presence_of :land
  validate :validate_position

  enumerize :way, in: [:n, :e, :s, :w]

  def position
    [x, y]
  end

  def location
    [x, y, way]
  end

  def location=(value)
    self.x = value[0]
    self.y = value[1]
    self.way = value[2]
  end

  def track(actions)
    actions.each do |action|
      break unless valid?
      case action.to_sym
      when :l
        turn_left
      when :r
        turn_right
      when :m
        move
        end
    end
  end

  protected

  def turn_left
    case way.to_sym
    when :n
      self.way = :w
    when :w
      self.way = :s
    when :s
      self.way = :e
    when :e
      self.way = :n
      end
  end

  def turn_right
    case way.to_sym
    when :n
      self.way = :e
    when :e
      self.way = :s
    when :s
      self.way = :w
    when :w
      self.way = :n
      end
  end

  def move
    case way.to_sym
    when :n
      self.y += 1
    when :e
      self.x += 1
    when :s
      self.y -= 1
    when :w
      self.x -= 1
      end
  end

  private

  def validate_position
    errors.add(:position, 'out of land limits') if self.x < 0 || self.y < 0 || x > land.x || y > land.y
  end
end
