module Blink
  class Camera

    include HTTParty
    base_uri Blink::Constants::BASE

    attr_reader :id, :name, :enabled, :wifi_strength, :network_id

    def initialize id, name, enabled, wifi_strength, network_id
      @id = id
      @name = name
      @enabled = enabled
      @wifi_strength = wifi_strength
      @network_id = network_id
      @headers = { 
        "Content-Type"  => "application/json",
        "TOKEN_AUTH" => Blink::Constants.token 
      }
    end

    def enable

      @options = {
        headers: @headers
      }

      response = self.class.post("/network/#{self.network_id}/camera/#{self.id}/enable", @options)

      case response.code
        when 200
          @enabled = true
        when 404
          throw Exception.new
        when 500...600
          throw Exception.new
      end
    end

    def disable

      @options = {
        headers: @headers
      }

      response = self.class.post("/network/#{self.network_id}/camera/#{self.id}/disable", @options)

      case response.code
        when 200
          @enabled = false
        when 404
          throw Exception.new
        when 500...600
          throw Exception.new
      end
    end
  end 
end