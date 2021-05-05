require 'oystercard'

describe Oystercard do
  let (:station){ double :station }
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

  describe '#touch_in' do
    it 'tells the user the card is touched in' do
      card = Oystercard.new
      card.top_up(10)
      result = card.touch_in(station)
      expect(result).to eq("touched in")
    end
    context 'when the user has less than the minimum allowed journey balance' do
      it 'raise an error' do
        card = Oystercard.new
        expect { card.touch_in(station) }.to raise_error('Balance is below minimum required for touch-in')
      end
    end
    it 'remembers entry station' do
      subject.top_up(1)
      subject.touch_in(station)
      expect (subject.entry_station).to eq station
      # expect (subject).to respond_to (@entry_station)
    end
  end

  describe '#touch_out' do
    
    it 'tells the user their card has touched out' do
      card = Oystercard.new
      result = card.touch_out
      expect(result).to eq("touched out")
    end
    it 'deducts minimum amount from balance' do
      subject.top_up(1)
      subject.touch_in(station)
      expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_TOUCH_IN_BALANCE)
    end
    it 'expects entry_station to return to nil' do
      card = Oystercard.new
      card.top_up(1)
      card.touch_in(station)
      card.touch_out
      expect(card.entry_station).to eq(nil)
    end
  end

  describe '#in_journey?' do
    context 'when the user has touched in' do
      it "returns True" do
        card = Oystercard.new
        card.top_up(10)
        card.touch_in(station)
        expect(card).to be_in_journey
      end
    end
    context 'when the user has touched out' do
      it "returns False" do
        card = Oystercard.new
        card.top_up(10)
        card.touch_in(station)
        card.touch_out
        expect(card).not_to be_in_journey
      end
    end
  end
end