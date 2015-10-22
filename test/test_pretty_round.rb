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
    assert_ep -2, -1.1.roundup
    assert_ep -2, -1.9.roundup
    
    x = 123.456
    assert_ep 124, x.roundup
    assert_ep 123.46, x.roundup(2)
    assert_ep 200, x.roundup(-2)
    
    x = -123.456
    assert_ep -124, x.roundup
    assert_ep -123.46, x.roundup(2)
    assert_ep -200, x.roundup(-2)
  end

  def test_rounddown
    assert_ep  1,  1.9.rounddown
    assert_ep  1,  1.1.rounddown
    assert_ep -1, -1.1.rounddown
    assert_ep -1, -1.9.rounddown
    
    x = 123.456
    assert_ep 123, x.rounddown
    assert_ep 123.45, x.rounddown(2)
    assert_ep 100, x.rounddown(-2)
    
    x = -123.456
    assert_ep -123, x.rounddown
    assert_ep -123.45, x.rounddown(2)
    assert_ep -100, x.rounddown(-2)
  end
  
  def test_mceil
    assert_ep  2,  1.9.mceil(1)
    assert_ep  2,  1.1.mceil(1)
    assert_ep -1, -1.1.mceil(1)
    assert_ep -1, -1.9.mceil(1)
    
    x = 123.456
    assert_ep 124, x.mceil(-2)
    assert_ep 123.46, x.mceil(-0.01)
    assert_ep 125, x.mceil(25)
    
    x = -123.456
    assert_ep -122, x.mceil(-2)
    assert_ep -123.45, x.mceil(-0.01)
    assert_ep -100, x.mceil(25)
  end
  
  def test_mfloor
    assert_ep  1,  1.9.mfloor(1)
    assert_ep  1,  1.1.mfloor(1)
    assert_ep -2, -1.1.mfloor(1)
    assert_ep -2, -1.9.mfloor(1)
    
    x = 123.456
    assert_ep 122, x.mfloor(-2)
    assert_ep 123.45, x.mfloor(-0.01)
    assert_ep 100, x.mfloor(25)
    
    x = -123.456
    assert_ep -124, x.mfloor(-2)
    assert_ep -123.46, x.mfloor(-0.01)
    assert_ep -125, x.mfloor(25)
  end
  
  def test_mroundup
    assert_ep  2,  1.9.mroundup(1)
    assert_ep  2,  1.1.mroundup(1)
    assert_ep -2, -1.1.mroundup(1)
    assert_ep -2, -1.9.mroundup(1)
    
    x = 123.456
    assert_ep 124, x.mroundup(-2)
    assert_ep 123.46, x.mroundup(-0.01)
    assert_ep 125, x.mroundup(25)
    
    x = -123.456
    assert_ep -124, x.mroundup(-2)
    assert_ep -123.46, x.mroundup(-0.01)
    assert_ep -125, x.mroundup(25)
  end

  def test_mrounddown
    assert_ep  1,  1.9.mrounddown(1)
    assert_ep  1,  1.1.mrounddown(1)
    assert_ep -1, -1.1.mrounddown(1)
    assert_ep -1, -1.9.mrounddown(1)
    
    x = 123.456
    assert_ep 122, x.mrounddown(-2)
    assert_ep 123.45, x.mrounddown(-0.01)
    assert_ep 100, x.mrounddown(25)
    
    x = -123.456
    assert_ep -122, x.mrounddown(-2)
    assert_ep -123.45, x.mrounddown(-0.01)
    assert_ep -100, x.mrounddown(25)
  end
  
  def test_mround
    assert_ep  2,  1.9.mround(1)
    assert_ep  1,  1.1.mround(1)
    assert_ep -1, -1.1.mround(1)
    assert_ep -2, -1.9.mround(1)
    
    x = 123.456
    assert_ep 124, x.mround(-2)
    assert_ep 123.46, x.mround(-0.01)
    assert_ep 125, x.mround(25)
    
    x = -123.456
    assert_ep -124, x.mround(-2)
    assert_ep -123.46, x.mround(-0.01)
    assert_ep -125, x.mround(25)
  end
  
  
  def test_sceil
    x = 123.456
    assert_ep 200, x.sceil(1)
    assert_ep 124, x.sceil(3)
    assert_ep 123.5, x.sceil(4)
    assert_ep 123.456, x.sceil(6)
    
    x = -123.456
    assert_ep -100, x.sceil(1)
    assert_ep -123, x.sceil(3)
    assert_ep -123.4, x.sceil(4)
    assert_ep -123.456, x.sceil(6)
  end
  
  def test_sfloor
    x = 123.456
    assert_ep 100, x.sfloor(1)
    assert_ep 123, x.sfloor(3)
    assert_ep 123.4, x.sfloor(4)
    assert_ep 123.456, x.sfloor(6)
    
    x = -123.456
    assert_ep -200, x.sfloor(1)
    assert_ep -124, x.sfloor(3)
    assert_ep -123.5, x.sfloor(4)
    assert_ep -123.456, x.sfloor(6)
  end
  
  def test_sroundup
    x = 123.456
    assert_ep 200, x.sroundup(1)
    assert_ep 124, x.sroundup(3)
    assert_ep 123.5, x.sroundup(4)
    assert_ep 123.456, x.sroundup(6)
    
    x = -123.456
    assert_ep -200, x.sroundup(1)
    assert_ep -124, x.sroundup(3)
    assert_ep -123.5, x.sroundup(4)
    assert_ep -123.456, x.sroundup(6)
  end

  def test_srounddown
    x = 123.456
    assert_ep 0, x.srounddown(-1)
    assert_ep 0, x.srounddown(0)
    assert_ep 100, x.srounddown(1)
    assert_ep 123, x.srounddown(3)
    assert_ep 123.4, x.srounddown(4)
    assert_ep 123.456, x.srounddown(6)
    
    x = -123.456
    assert_ep 0, x.srounddown(-1)
    assert_ep 0, x.srounddown(0)
    assert_ep -100, x.srounddown(1)
    assert_ep -123, x.srounddown(3)
    assert_ep -123.4, x.srounddown(4)
    assert_ep -123.456, x.srounddown(6)
  end

  def test_sround
    x = 123.456
    assert_ep 100, x.sround(1)
    assert_ep 123, x.sround(3)
    assert_ep 123.5, x.sround(4)
    assert_ep 123.456, x.sround(6)
    
    x = -123.456
    assert_ep -100, x.sround(1)
    assert_ep -123, x.sround(3)
    assert_ep -123.5, x.sround(4)
    assert_ep -123.456, x.sround(6)
  end
end
