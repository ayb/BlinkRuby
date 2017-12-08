module Blink
  class Camera
    attr_reader :id, :name, :enabled, :wifi_strength, :network_id

    def initialize id, name,network_id, enabled, wifi_strength
      @id = id
      @name = name
      @enabled = enabled
      @wifi_strength = wifi_strength
      @network_id = network_id
    end
  end 
end