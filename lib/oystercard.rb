class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90
  MINIMUM_TOUCH_IN_BALANCE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise ("Top-up would put you over: #{MAX_BALANCE}") if top_up_would_reach_limit?(amount)
    @balance += amount
  end

  def touch_in
    raise 'Balance is below minimum required for touch-in' if balance_below_minimum
    @in_journey = true
    "touched in"
  end

  def touch_out
    deduct(MINIMUM_TOUCH_IN_BALANCE)
    @in_journey = false
    'touched out'
  end

  def in_journey?
    @in_journey
  end

  private

  def top_up_would_reach_limit?(amount)
    balance + amount > MAX_BALANCE
  end

  def balance_below_minimum
    @balance < MINIMUM_TOUCH_IN_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end
end