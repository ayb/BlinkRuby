RSpec.describe Blink::System do
  before(:all) do
      @system = Blink::System.new ENV['BLINK_EMAIL'] , ENV['BLINK_PASSWORD']
  end

  it "should return a list of networks" do
    expect(@system.networks).to all(be_a Blink::Network)
  end
end