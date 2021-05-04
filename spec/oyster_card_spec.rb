require 'oystercard'
describe Oystercard do
  it " has a balance of 0" do
  #arrange
  card = Oystercard.new
  #act
  balance = card.balance
  #assert
  expect(balance).to eq(0) 
  end
end