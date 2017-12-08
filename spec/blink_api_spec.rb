RSpec.describe Blink::API do

  before(:all) do
    @network_id = 7681
    @camera_id = 19729
    @blink = Blink::API.new
    @blink.token = ENV['BLINK_TOKEN']
  end

  it "should retrieve an api token on login" do
    @blink.login ENV['BLINK_USERNAME'], ENV['BLINK_PASSWORD']
    expect(@blink.token).to be_a(String)
  end

  it "should get a list of networks" do
    expect(@blink.networks).to all(be_a(Blink::Network))
  end

  it "should get a list of sync modules" do
    expect(@blink.sync_modules @network_id).to be_a(Blink::SyncModule)
  end

  it "should list all cameras" do
    expect(@blink.cameras @network_id).to all(be_a(Blink::Camera))
  end

  it "should get a single camera" do
    expect(@blink.camera @network_id, @camera_id).to be_a(Blink::Camera)
  end

  it "should create an arm network command" do
    command = @blink.arm_network @network_id
    expect(command).to be_a(Blink::Command)
    
    poll command
  end  

  it "should create a disarm network command" do
    command = @blink.disarm_network @network_id
    expect(command).to be_a(Blink::Command)
    
    poll command
  end

  it "should create an enable camera command" do
    command = @blink.enable_camera @network_id , @camera_id
    expect(command).to be_a(Blink::Command)

    poll command
  end

  it "should create an disable camera command" do
    command = @blink.disable_camera @network_id , @camera_id
    expect(command).to be_a(Blink::Command)

    poll command
  end
end