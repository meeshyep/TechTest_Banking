require 'money'

describe Money do

  subject(:money) {described_class.new(1000)}
  let(:add_amount) {described_class.new(2000)}
  let(:minus_amount) {described_class.new(500)}

  it 'has a value in cents' do
    expect(money.value).to eq(1000)
  end

  it "is shown in dollars" do
    expect(money.to_s).to eq ("$1000.00")
  end

  it "can add two amounts together" do
    result = money + add_amount
    expect(result.value).to eq (3000)
  end

  it "can subtract two amounts from each other" do
    result = money - minus_amount
    expect(result.value).to eq(500)
  end

end
