RSpec.describe Blink::Network do

  before(:each) do
      Blink::Constants.token = ENV['BLINK_TOKEN']
      @id = 7681
      @name = "112 Waterside"
      @armed = true
      @description = "A description"
      @network = Blink::Network.new @id, @name, @armed, @description
  end

  it "should set id from constructor" do
    expect(@network.id).to eq(@id)
  end

  it "should set name from constructor" do
    expect(@network.name).to eq(@name)
  end

  it "should set armed from constructor" do
    expect(@network.armed).to eq(@armed)
  end

  it "should return a list of sync modules" do
    expect(@network.sync_modules).to be_a(Blink::SyncModule)
  end

  it "should return a list of cameras" do
    expect(@network.cameras).to all(be_a(Blink::Camera))
  end

  it "should arm the system when armed" do
    @network.arm
    expect(@network.armed).to be(true)
    # wait for system to be ready
    sleep 5
  end

  it "should disarm the system when disarmed" do
    @network.disarm
    expect(@network.armed).to be(false)
  end
end