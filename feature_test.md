card = Oystercard.new

card.balance # should return 0

card.top_up(50)

card.balance # should return 50

card.top_up(100) # should raise an exception 

card.deduct(10)

card.balance # should return 40

card.in_journey? # should return boolean

card.touch_in(station) # should return string "touched in" and return station

card.entry_station # return string entry station

card.in_journey? # should return boolean

card.touch_out # should return string "touched out" and ! Reduce by minimum fare !

card.in_journey? # should return boolean

card2 = Oystercard.new

card.touch_in # should raise an exception
