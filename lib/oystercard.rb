class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90
  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise ("Top-up would put you over: #{MAX_BALANCE}") if top_up_would_reach_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
    "touched in"
  end

  def touch_out
    @in_journey = false
    "touched out"
  end

  def in_journey?
    @in_journey
  end

  private

  def top_up_would_reach_limit?(amount)
    balance + amount > MAX_BALANCE
  end
end

