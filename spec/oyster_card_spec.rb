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
      expect { card.top_up(50) }.to change { card.balance }.from(0).to(50)
    end
    context " when the top_up amount goes over the limit" do
      it "raises an error" do 
      expect { subject.top_up Oystercard::MAX_BALANCE + 1 }.to raise_error "Top-up would put you over: #{Oystercard::MAX_BALANCE}"
      end
    end    
  end

  describe '#deduct' do
    it 'subtracts a given amount from the balance' do
      card = Oystercard.new
      top_up_value = 20
      deduct_value = 10
      card.top_up(top_up_value)
      expect { card.deduct(deduct_value) }.to change { card.balance }.from(top_up_value).to(top_up_value - deduct_value)
    end
  end

  describe '#touch_in' do
    it 'tells the user the card is touched in' do
      card = Oystercard.new
      result = card.touch_in
      expect(result).to eq("touched in")
    end
  end

  describe '#touch_out' do
    it 'tells the user their card has touched out' do
      card = Oystercard.new
      result = card.touch_out
      expect(result).to eq("touched out")
    end
  end

  describe '#in_journey?' do
    context 'when the user has touched in' do
      it "returns True" do
        card = Oystercard.new
        card.touch_in
        expect(card).to be_in_journey
      end
    end
    context 'when the user has touched out' do
      it "returns False" do
        card = Oystercard.new
        card.touch_in
        card.touch_out
        expect(card).not_to be_in_journey
      end
    end
  end
end
