# RSpec.describe Blink::Network do

#   before(:each) do
#       @id = 100
#       @name = "Network Name"
#       @armed = true
#       @description = "A description"
#       @network = Blink::Network.new @id, @name, @armed, @description
#   end

#   it "should set id from constructor" do
#     expect(@network.id).to eq(@id)
#   end

#   it "should set name from constructor" do
#     expect(@network.name).to eq(@name)
#   end

#   it "should set armed from constructor" do
#     expect(@network.armed).to eq(@armed)
#   end

#   it "should return a list of sync modules" do
#     expect(@network.sync_modules).to all(be_a Blink::SyncModule)
#   end
# end