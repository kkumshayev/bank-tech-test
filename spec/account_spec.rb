require 'account'

describe Account do
  TEST_DEPOSIT = 20
  TEST_WITHDRAWAL = 10

  it { is_expected.to respond_to(:deposit).with(1).argument }
  it { is_expected.to respond_to(:withdraw).with(1).argument }

  it 'can be deposited into' do
    test_account = Account.new()
    expect{test_account.deposit(TEST_DEPOSIT)}.to change{test_account.balance}.by(TEST_DEPOSIT)
  end

  it 'can be withdrawn from' do
    test_account = Account.new()
    test_account.deposit(TEST_DEPOSIT)
    expect{test_account.withdraw(TEST_WITHDRAWAL)}.to change{test_account.balance}.by(-TEST_WITHDRAWAL)
  end

  it 'raises an error when attempting to withdraw more than the current balance' do
    test_account = Account.new()
    expect{test_account.withdraw(TEST_WITHDRAWAL)}.to raise_error 'insufficient funds'
  end

end
