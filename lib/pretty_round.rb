
class Numeric
  # Rounding up with given precision.
  # This method round up to far from 0 direction.
  def roundup(digit=0)
    x = 10**(-digit)
    if self > 0
      quo(x).ceil * x
    else
      quo(x).floor * x
    end
  end

  # Rounding down with given precision.
  # This method round down to near to 0 direction.
  def rounddown(digit=0)
    x = 10**(-digit)
    if self > 0
      quo(x).floor * x
    else
      quo(x).ceil * x
    end
  end
  
  
  # Return nearest multiple of given number that is equal to or greater than self.
  # This method round up to the positive infinity direction.
  def mceil(num)
    if (x = num * div(num)) == self
      self
    else
      [x, x+num].max
    end
  end
  
  # Return nearest multiple of given number that is equal to or less than self.
  # This method round down to the negative infinity direction.
  def mfloor(num)
    if (x = num * div(num)) == self
      self
    else
      [x, x+num].min
    end
  end
  
  # Return nearest multiple of given number that the absolute is equal to or greater than self.
  # This method round up to far from 0 direction.
  def mroundup(num)
    if (x = num * div(num)) == self
      self
    else
      [x, x+num].max_by(&:abs)
    end
  end
  
  # Return nearest multiple of given number that the absolute is equal to or less than self.
  # This method round down to near to 0 direction.
  def mrounddown(num)
    if (x = num * div(num)) == self
      self
    else
      [x, x+num].min_by(&:abs)
    end
  end
  
  # Retuen nearest multiple of given number.
  # When self is median of multiple of given number, return the multiple that have greater absolute.
  def mround(num)
    if (x = num * div(num)) == self
      self
    elsif x + x +num == self + self # if self is median
      [x, x+num].max_by(&:abs)
    else
      [x, x+num].min_by{|t| (t - self).abs}
    end
  end
  
  alias :mtruncate :mrounddown
  
  
  # Ceiling with given significant digit.
  def sceil(digit)
    selfdigit = Math.log10(abs).floor + 1
    mceil(10**(selfdigit - digit))
  end
  
  # Flooring with given significant digit.
  def sfloor(digit)
    selfdigit = Math.log10(abs).floor + 1
    mfloor(10**(selfdigit - digit))
  end
  
  # Rounding up with given significant digit.
  def sroundup(digit)
    selfdigit = Math.log10(abs).floor + 1
    mroundup(10**(selfdigit - digit))
  end
  
  # Rounding down with given significant digit.
  def srounddown(digit)
    selfdigit = Math.log10(abs).floor + 1
    mrounddown(10**(selfdigit - digit))
  end
  
  # Rounding off with given significant digit.
  def sround(digit)
    selfdigit = Math.log10(abs).floor + 1
    mround(10**(selfdigit - digit))
  end
  
  alias :struncate :srounddown
end
