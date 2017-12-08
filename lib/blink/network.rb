module Blink
  class Network
    attr_reader :id, :name, :armed, :description

    def initialize id, name, armed, description
      @id = id
      @name = name
      @armed = armed
      @description = description
    end
  end 
end