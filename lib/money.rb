class Money
  def initialize(value)
    @cent = value
  end

  def cent
    @cent
  end

  def to_s
    "$"+sprintf( "%0.02f", @cent/100)
  end

  def +(other)
    Money.new(self.cent + other.cent)
  end

  def -(other)
    Money.new(self.cent - other.cent)
  end
end
