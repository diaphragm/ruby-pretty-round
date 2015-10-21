require 'minitest'
require 'pretty_round'

Minitest.autorun

class TEST_PrettyRound < Minitest::Test
  def assert_ep(expect, target)
    assert_in_epsilon(expect, target, Float::EPSILON)
  end
  
  def test_roundup
    assert_ep  2,  1.9.roundup
    assert_ep  2,  1.1.roundup
    assert_ep -1, -1.1.roundup
    assert_ep -1, -1.9.roundup
    
    x = 123.456
    assert_ep 124, x.roundup
    assert_ep 123.46, x.roundup(2)
    assert_ep 200, x.roundup(-2)
    
    x = -123.456
    assert_ep -123, x.roundup
    assert_ep -123.45, x.roundup(2)
    assert_ep -100, x.roundup(-2)
  end
  
  def test_rounddown
    assert_ep  1,  1.9.rounddown
    assert_ep  1,  1.1.rounddown
    assert_ep -2, -1.1.rounddown
    assert_ep -2, -1.9.rounddown
    
    x = 123.456
    assert_ep 123, x.rounddown
    assert_ep 123.45, x.rounddown(2)
    assert_ep 100, x.rounddown(-2)
    
    x = -123.456
    assert_ep -124, x.rounddown
    assert_ep -123.46, x.rounddown(2)
    assert_ep -200, x.rounddown(-2)
  end
  
  def test_mroundup
    assert_ep  2,  1.9.mroundup(1)
    assert_ep  2,  1.1.mroundup(1)
    assert_ep -1, -1.1.mroundup(1)
    assert_ep -1, -1.9.mroundup(1)
    
    x = 123.456
    assert_ep 124, x.mroundup(-1)
    assert_ep 123.46, x.mroundup(-0.01)
    assert_ep 200, x.mroundup(100)
    
    x = -123.456
    assert_ep -123, x.mroundup(-1)
    assert_ep -123.45, x.mroundup(-0.01)
    assert_ep -100, x.mroundup(100)
  end
  
  def test_mrounddown
    assert_ep  1,  1.9.mrounddown(1)
    assert_ep  1,  1.1.mrounddown(1)
    assert_ep -2, -1.1.mrounddown(1)
    assert_ep -2, -1.9.mrounddown(1)
    
    x = 123.456
    assert_ep 123, x.mrounddown(-1)
    assert_ep 123.45, x.mrounddown(-0.01)
    assert_ep 100, x.mrounddown(100)
    
    x = -123.456
    assert_ep -124, x.mrounddown(-1)
    assert_ep -123.46, x.mrounddown(-0.01)
    assert_ep -200, x.mrounddown(100)
  end
  
  def test_mround
    assert_ep  2,  1.9.mround(1)
    assert_ep  1,  1.1.mround(1)
    assert_ep -1, -1.1.mround(1)
    assert_ep -2, -1.9.mround(1)
    
    x = 123.456
    assert_ep 123, x.mround(-1)
    assert_ep 123.46, x.mround(-0.01)
    assert_ep 100, x.mround(100)
    
    x = -123.456
    assert_ep -123, x.mround(-1)
    assert_ep -123.46, x.mround(-0.01)
    assert_ep -100, x.mround(100)
  end
  
  def test_sround
    x = 123.456
    assert_ep 0, x.sround(-1)
    assert_ep 0, x.sround(0)
    assert_ep 100, x.sround(1)
    assert_ep 123, x.sround(3)
    assert_ep 123.5, x.sround(4)
    assert_ep 123.456, x.sround(6)
    
    x = -123.456
    assert_ep 0, x.sround(-1)
    assert_ep 0, x.sround(0)
    assert_ep -100, x.sround(1)
    assert_ep -123, x.sround(3)
    assert_ep -123.5, x.sround(4)
    assert_ep -123.456, x.sround(6)
  end
end
