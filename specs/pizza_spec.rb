require('minitest/autorun')
require('minitest/rg')
require_relative('../models/pizza')

class TestPizza < MiniTest::Test

  def setup
   options = {
    'first_name' => 'Sam',
    'last_name' => 'Parkyn',
    'pizza' => 'Calzone',
    'quantity' => '5'
   }

   @pizza = Pizza.new(options)
  end


  def test_first_name()
    assert_equal("Sam", @pizza.first_name())
  end

  def test_last_name()
    assert_equal("Parkyn", @pizza.last_name())
  end

  def test_space_between_names()
    assert_equal("Sam Parkyn", @pizza.space_between_names())
  end

  def test_total()
    assert_equal(50, @pizza.total())

  end

end