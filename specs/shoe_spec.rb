require('minitest/autorun')
require_relative('../models/shoe')

class TestShoe < Minitest::Test

  def setup
    options = {
      "first_name" => "Jeff",
      "last_name" => "Lloyd",
      "size"  =>"size 7",
      "quantity" => 10
    }
    
    @shoe = Shoe.new(options)
  end

  def test_first_name
    assert_equal( 'Jeff', @shoe.first_name())
  end  

  def test_last_name
    assert_equal( 'Lloyd', @shoe.last_name())
  end  

  def test_pretty_name
    assert_equal('Jeff Lloyd', @shoe.pretty_name())
  end 

  def test_size
    assert_equal('size 7', @shoe.size())
  end 

  def test_quantity
    assert_equal( Fixnum, @shoe.quantity.class())
    assert_equal( 10, @shoe.quantity())
  end 

end