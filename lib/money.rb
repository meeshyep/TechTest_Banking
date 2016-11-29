class Money
  def initialize(value)
    @value = value
  end

  def value
    @value
  end

  def to_s
    "$"+sprintf( "%0.02f", @value)
  end

  def +(other)
    return Money.new(self.value + other.value)
  end

  def -(other)
    return Money.new(self.value - other.value)
  end
end
