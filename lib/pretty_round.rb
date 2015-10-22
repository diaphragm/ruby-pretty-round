
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
    #
    # MEMO: maybe ruby bug: 
    #   123.456.divmod(1/10r) => [123456, 4.996003610813204e-16]
    #
    #div, mod = divmod(num)
    div = self.div(num); mod = self - div*num
    x = num * div; y = x + (mod.zero? ? 0 : num)
    [x, y].max
  end
  
  # Return nearest multiple of given number that is equal to or less than self.
  # This method round down to the negative infinity direction.
  def mfloor(num)
    div = self.div(num); mod = self - div*num
    x = num * div; y = x + (mod.zero? ? 0 : num)
    [x, y].min
  end
  
  # Return nearest multiple of given number that the absolute is equal to or greater than self.
  # This method round up to far from 0 direction.
  def mroundup(num)
    div = self.div(num); mod = self - div*num
    x = num * div; y = x + (mod.zero? ? 0 : num)
    [x, y].max_by(&:abs)
  end
  
  # Return nearest multiple of given number that the absolute is equal to or less than self.
  # This method round down to near to 0 direction.
  def mrounddown(num)
    div = self.div(num); mod = self - div*num
    x = num * div; y = x + (mod.zero? ? 0 : num)
    [x, y].min_by(&:abs)
  end
  
  # Retuen nearest multiple of given number.
  # When self is median of multiple of given number, return the multiple that have greater absolute.
  def mround(num)
    div = self.div(num); mod = self - div*num
    x = num * div; y = x + (mod.zero? ? 0 : num)
    if mod.quo(num).abs * 2 == 1
      [x, y].max_by(&:abs)
    else
      [x, y].min_by{|t| (t - self).abs}
    end
  end
  
  alias :mtruncate :mrounddown
  
  
  # Ceiling with given significant digit.
  def sceil(digit)
    numdigit = Math.log10(abs).floor + 1
    mceil(10**(numdigit - digit))
  end
  
  # Flooring with given significant digit.
  def sfloor(digit)
    numdigit = Math.log10(abs).floor + 1
    mfloor(10**(numdigit - digit))
  end
  
  # Rounding up with given significant digit.
  def sroundup(digit)
    numdigit = Math.log10(abs).floor + 1
    mroundup(10**(numdigit - digit))
  end
  
  # Rounding down with given significant digit.
  def srounddown(digit)
    numdigit = Math.log10(abs).floor + 1
    mrounddown(10**(numdigit - digit))
  end
  
  # Rounding off with given significant digit.
  def sround(digit)
    numdigit = Math.log10(abs).floor + 1
    mround(10**(numdigit - digit))
  end
  
  alias :struncate :srounddown
end
