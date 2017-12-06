module Blink
  class System

    include HTTParty
    base_uri Blink::Constants::BASE

    attr_reader :token, :email, :password, :networks

    def initialize email, password
      @email = email
      @password = password
      @headers = { 
        "Content-Type"  => "application/json" 
      }

      self.login
    end

    def login
      @options = {
        query: {
          email: self.email,
          password: self.password
        },
        headers: @headers
      }

      response = self.class.post("/login", @options)

      case response.code
        when 200
          body = JSON.parse(response.body)
          Blink::Constants.token = body["authtoken"]["authtoken"]
          @headers["TOKEN_AUTH"] = Blink::Constants.token
        when 404
          throw Exception.new
        when 500...600
          throw Exception.new
      end
    end

    def networks

      @options = {
        headers: @headers
      }

      response = self.class.get("/networks", @options)

      case response.code
        when 200
          body = JSON.parse(response.body)
          @networks = body['networks'].map do |data|
            Network.new data['id'], data['name'], data['armed'], data['description']
          end
        when 404
          throw Exception.new
        when 500...600
          throw Exception.new
      end
    end
  end
end
