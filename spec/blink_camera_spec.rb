RSpec.describe Blink::Camera do

  before(:all) do

      Blink::Constants.token = ENV['BLINK_TOKEN']
      @id = 19729
      @name = "Garden"
      @enabled = false
      @network_id = 7681
      @camera = Blink::Camera.new @id, @name,@network_id, @enabled, @description
  end

  it "should set id from constructor" do
    expect(@camera.id).to eq(@id)
  end

  it "should set name from constructor" do
    expect(@camera.name).to eq(@name)
  end

  it "should set armed from constructor" do
    expect(@camera.enabled).to eq(@enabled)
  end

  it "should enable the camera when enabled" do
    @camera.enable
    expect(@camera.enabled).to be(true)
    # wait for system to be ready
    sleep 5
  end

  it "should disable the camera when disarmed" do
    @camera.disable
    expect(@camera.enabled).to be(false)
  end
end