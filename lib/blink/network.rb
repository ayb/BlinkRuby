module Blink
  class Network

    include HTTParty
    base_uri Blink::Constants::BASE

    attr_reader :id, :name, :armed, :description

    def initialize id, name, armed, description
      @id = id
      @name = name
      @armed = armed
      @description = description
      @headers = { 
        "Content-Type"  => "application/json",
        "TOKEN_AUTH" => Blink::Constants.token 
      }
    end

    def cameras

      @options = {
        headers: @headers
      }

      response = self.class.get("/network/#{self.id}/cameras", @options)

      case response.code
        when 200
          body = JSON.parse(response.body)
          body['devicestatus'].map do |data|
            Camera.new data['id'], data['name'], self.id, data['enabled'], data['wifi_strength']
          end
        when 404
          throw Exception.new(response.body)
        when 500...600
          throw Exception.new(response.body)
      end
    end

    def sync_modules

      @options = {
        headers: @headers
      }

      response = self.class.get("/network/#{self.id}/syncmodules", @options)

      case response.code
        when 200
          body = JSON.parse(response.body)
          parsed = body['syncmodule']
          SyncModule.new parsed['id'],parsed['name'],parsed['status'],parsed['wifi_strength']
        when 404
          throw Exception.new(response.body)
        when 500...600
          throw Exception.new(response.body)
      end
    end

    def arm

      @options = {
        headers: @headers
      }

      response = self.class.post("/network/#{self.id}/arm", @options)

      case response.code
        when 200
          @armed = true
        when 404
          throw Exception.new(response.body)
        when 500...600
          throw Exception.new(response.body)
      end
    end

    def disarm

      @options = {
        headers: @headers
      }

      response = self.class.post("/network/#{self.id}/disarm", @options)

      case response.code
        when 200
          @armed = false
        when 404
          throw Exception.new(response.body)
        when 500...600
          throw Exception.new(response.body)
      end
    end
  end 
end