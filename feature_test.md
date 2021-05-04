card = Oystercard.new

card.balance # should return 0

card.top_up(50)

card.balance # should return 50

card.top_up(100) # should raise an exception 
