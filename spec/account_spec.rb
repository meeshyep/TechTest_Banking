require 'account'

describe Account do
  let(:money_class) {double :money_class, new: money}
  let(:money) {double :money, to_s: "$0.00", :+ => new_balance, :- => new_balance}
  let(:new_balance) {double :money, to_s: "$100.00"}
  subject(:account) {described_class.new(money_class)}

  it 'allows the money class to show the current balance' do
    expect(money).to receive(:to_s)
    account.current_balance
  end

  describe 'Deposits' do

    it 'allows money to be added to an account' do
      account.deposit(100)
      expect(money_class).to have_received(:new).with(100)
    end

    it 'defers to money instance to add two values' do
      account.deposit(100)
      expect(money).to have_received(:+)
    end

    it 'saves the new balance to the current_balance' do
      account.deposit(100)
      expect(account.current_balance).to eq("$100.00")
    end
  end

  describe 'Withdrawals' do
    it 'allows money to be subtracted from an account' do
      account.withdraw(100)
      expect(money_class).to have_received(:new).with(100)
    end

    it 'defers to money instance to subtract two values' do
      account.withdraw(100)
      expect(money).to have_received(:-)
    end

    it 'saves the new balance to the current_balance' do
      account.withdraw(100)
      expect(account.current_balance).to eq("$100.00")
    end
  end
end
