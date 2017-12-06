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

    def sync_modules

      @options = {
        headers: @headers
      }

      response = self.class.get("/network/#{self.id}/syncmodules", @options)

      case response.code
        when 200
          body = JSON.parse(response.body)
          puts body
        when 404
          throw Exception.new
        when 500...600
          throw Exception.new
      end
    end
  end 

end