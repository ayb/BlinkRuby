# Blink

This is a basic implementation of the Blink Home Api in Ruby. It is only in beta at this moment and is missing many features

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'blink-home'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blink

## Usage


```

  # login
  @blink = Blink::API.new
  @blink.login username,password
  
  # or set the token manually
  @blink.token = token
  
  # list of networks
  networks = @blink.networks

  # all sync module on network
  sync_module = @blink.sync_modules network_id

  # list all cameras
  networks = @blink.cameras network_id

  # get a single camera
  camera = @blink.camera @network_id, @camera_id
  
  # create an arm network command
  command = @blink.arm_network network_id

  # create a disarm network command
  command = @blink.disarm_network network_id

  # create an enable camera command
  command = @blink.enable_camera network_id, camera_id

  # create a disable camera command
  command = @blink.disable_camera network_id, camera_id

  # request command status
  status = @blink.command_status network_id, command_id
  
  # wait for command to be complete
  @blink.wait_for_command network_id, command_id

```