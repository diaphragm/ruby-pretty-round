
module PrettyRound
  # Rounding up with given precision.
  # This method round up to far from 0 direction.
  def roundup(digit=0)
    abs.ceil(digit) * (positive? ? 1 : -1)
  end

  # Rounding down with given precision.
  # This method round down to near to 0 direction.
  def rounddown(digit=0)
    abs.floor(digit) * (positive? ? 1 : -1)
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
    elsif x + x+num == self + self # if self is median
      [x, x+num].max_by(&:abs)
    else
      [x, x+num].min_by{|t| (t - self).abs}
    end
  end

  alias_method :mtruncate, :mrounddown


  # Ceiling with given significant digit.
  def sceil(digit)
    return self if zero?
    selfdigit = Math.log10(abs).floor + 1
    ceil(digit - selfdigit)
  end

  # Flooring with given significant digit.
  def sfloor(digit)
    return self if zero?
    selfdigit = Math.log10(abs).floor + 1
    floor(digit - selfdigit)
  end

  # Rounding up with given significant digit.
  def sroundup(digit)
    return self if zero?
    selfdigit = Math.log10(abs).floor + 1
    abs.ceil(digit - selfdigit) * (positive? ? 1 : -1)
  end

  # Rounding down with given significant digit.
  def srounddown(digit)
    return self if zero?
    selfdigit = Math.log10(abs).floor + 1
    abs.floor(digit - selfdigit) * (positive? ? 1 : -1)
  end

  # Rounding off with given significant digit.
  def sround(digit)
    return self if zero?
    selfdigit = Math.log10(abs).floor + 1
    round(digit - selfdigit)
  end

  alias_method :struncate, :srounddown
end

module PrettyRound
  refine Numeric do
    include(PrettyRound)
  end
end
