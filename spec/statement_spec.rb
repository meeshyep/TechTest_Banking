require 'statement'

describe Statement do

  subject(:statement) {described_class.new}
  let (:credit) {double :money, to_s: "$500.00", value: 500}
  let (:debit) {double :money, to_s: "$500.00", value: -500}

  it 'prints an empty statement' do
    expect(statement.to_s).to eq("date || credit || debit || balance\n")
  end

  it 'records transactons' do
    transaction = {date: Date.today, amount: credit, balance: credit }
    expect(statement.record(transaction)).to eq([{date: Date.today, amount: credit, balance: credit}])
  end

  it 'prints credit transactions when they are entered' do
    statement.record(date: Date.today, amount: credit, balance: credit)
    expect(statement.to_s).to include("2016-11-29 || £500.00 || || £500.00\n")
  end

  it 'prints debit transactions when they are entered' do
    statement.record(date: Date.today, amount: debit, balance: debit)
    expect(statement.to_s).to include("2016-11-29 || || £500.00 || £500.00\n")
  end
end
