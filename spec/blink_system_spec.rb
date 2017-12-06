RSpec.describe Blink::System do
  before(:all) do
      @system = Blink::System.new "steveyblam@hotmail.co.uk" , "root55561"
  end

  it "should return a list of networks" do
    expect(@system.networks).to all(be_a Blink::Network)
  end
end