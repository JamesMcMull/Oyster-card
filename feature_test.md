card = Oystercard.new

card.balance # should return 0

card.top_up(50)

card.balance # should return 50

card.top_up(100) # should raise an exception 

card.deduct(10)

card.balance # should return 40

card.in_journey? # should return boolean

card.touch_in # should return string "touched in"

card.in_journey? # should return boolean

card.touch_out # should return string "touched out"

card.in_journey? # should return boolean
