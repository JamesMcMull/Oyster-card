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

  describe '#top_up' do
    it 'adds a given amount to the balance' do
      card = Oystercard.new
      expect { card.top_up(100) }.to change { card.balance }.from(0).to(100)
    end
  end
end
