module Blink
  class SyncModule
    attr_reader :id, :name, :status, :wifi_strength

    def initialize id, name, status, wifi_strength
      @id = id
      @name = name
      @status = status
      @wifi_strength = wifi_strength
    end
  end 
end