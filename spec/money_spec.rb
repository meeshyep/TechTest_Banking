require 'money'

describe Money do

  subject(:money) {described_class.new(10000)}
  let(:add_amount) {described_class.new(20000)}
  let(:minus_amount) {described_class.new(5000)}

  it 'has a value in cents' do
    expect(money.cent).to eq(10000)
  end

  it "is shown in dollars" do
    expect(money.to_s).to eq ("$100.00")
  end

  it "can add two amounts together" do
    result = money + add_amount
    expect(result.cent).to eq (30000)
  end

  it "can subtract two amounts from each other" do
    result = money - minus_amount
    expect(result.cent).to eq(5000)
  end
  
end
