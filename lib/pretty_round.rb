class Numeric
  # Ceiling with given precision.
  def roundup(d=0)
    x = 10**d
    self.quo(x).ceil * x
  end

  # Flooring with given precision.
  def rounddown(d=0)
    x = 10**d
   self.quo(x).ceil * x
  end
  
  
  # Return nearest multiple of given number that is equal to or greater than self.
  # This method round up to the positive infinity direction.
  def mroundup(num)
    div, mod = divmod(num)
    x = num * div; y = x + (mod.zero? ? 0 : num)
    [x, y].max
  end
  
  # Return nearest multiple of given number that is equal to or less than self.
  # This method round down to the negative infinity direction.
  def mrounddown(num)
    div, mod = divmod(num)
    x = num * div; y = x + (mod.zero? ? 0 : num)
    [x, y].min
  end
  
  # Retuen nearest multiple of given number.
  # When self is median of multiple of given number, return the multiple that have greater absolute.
  def mround(num)
    div, mod = divmod(num)
    x = num * div; y = x + (mod.zero? ? 0 : num)
    if mod.quo(num).abs * 2 == 1
      [x, y].max_by(&:abs)
    else
      [x, y].min_by{|t| (t - self).abs}
    end
  end
  
  
  # Rounding with given significant digit.
  def sround(digit, base=10)
    numdigit = Math.log(abs, base).floor + 1
    mround(base**(numdigit-digit))
  end
end
