require 'minitest/autorun'
require 'minitest/reporters'
require 'stringio'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction1 = Transaction.new(100)
  end

  def test_accept_money
    @transaction1.amount_paid = 100
    @register.accept_money(@transaction1)
    assert_equal(1100, @register.total_money)
  end

  def test_change
    @transaction1.amount_paid = 150
    assert_equal(50, @register.change(@transaction1))
  end

  def test_give_receipt
    expected = "You've paid $100.\n"
    assert_output(expected) { @register.give_receipt(@transaction1) }
  end

  def test_prompt_for_payment
    input = StringIO.new('100')
    output = StringIO.new
    @transaction1.prompt_for_payment(input: input, output: output)
    assert_equal(100, @transaction1.amount_paid)
  end
end