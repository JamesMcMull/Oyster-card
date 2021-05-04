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
end
