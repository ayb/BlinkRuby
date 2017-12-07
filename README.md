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

  # Create a new system object and pass it your email and password

  system = Blink::System.new email,password

  # arm or disarm the system
  system.arm
  puts system.armed # true

  system.disarm
  puts system.armed # false

  # request networks
  networks = system.networks

  # get the cameras on a network
  cameras = networks.first.cameras

  # enable or disable a cameras motion tracking
  camera = cameras.first

  camera.enable
  puts camera.enabled # true

  camera.disable
  puts camera.enabled # false

```