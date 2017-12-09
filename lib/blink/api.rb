module Blink
  class API
    include HTTParty

    base_uri "https://rest.prde.immedia-semi.com"

    def initialize
      @headers = { 
        "Content-Type"  => "application/json" 
      }
    end

    def token=(str)
      @headers["TOKEN_AUTH"] = str
    end

    def token
      @headers["TOKEN_AUTH"]
    end

    def login email, password
      @options = {
        query: {
          email: email,
          password: password
        },
        headers: @headers
      }

      response = self.class.post("/login", @options)

      case response.code
        when 200
          body = JSON.parse(response.body)
          self.token = body["authtoken"]["authtoken"]
        when 400...600
          throw Exception.new(response.body)
      end
    end

    def sync_modules id
      @options = {
        headers: @headers
      }

      response = self.class.get("/network/#{id}/syncmodules", @options)

      case response.code
        when 200
          body = JSON.parse(response.body)
          parsed = body['syncmodule']
          Blink::SyncModule.new parsed['id'],parsed['name'],parsed['status'],parsed['wifi_strength']
        when 400...600
          throw Exception.new(response.body)
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
          body['networks'].map do |data|
            Blink::Network.new data['id'], data['name'], data['armed'], data['description']
          end
        when 400...600
          throw Exception.new(response.body)
      end
    end

    def arm_network id
      @options = {
        headers: @headers
      }

      response = self.class.post("/network/#{id}/arm", @options)

      case response.code
        when 200
          self.bind_command JSON.parse(response.body)
        when 400...600
          throw Exception.new(response.body)
      end
    end

    def disarm_network id
      @options = {
        headers: @headers
      }

      response = self.class.post("/network/#{id}/disarm", @options)

      case response.code
        when 200
          command = JSON.parse(response.body)
          self.bind_command JSON.parse(response.body)
        when 400...600
          throw Exception.new(response.body)
      end
    end

    def network_programs

    end

    def cameras network_id
      @options = {
        headers: @headers
      }

      response = self.class.get("/network/#{network_id}/cameras", @options)

      case response.code
        when 200
          body = JSON.parse(response.body)
          body['devicestatus'].map do |data|
            Camera.new data['id'], data['name'], network_id, data['enabled'], data['wifi_strength']
          end
        when 404
          throw Exception.new(response.body)
        when 500...600
          throw Exception.new(response.body)
      end
    end

    def camera network_id, id
      @options = {
        headers: @headers
      }

      response = self.class.get("/network/#{network_id}/camera/#{id}", @options)

      case response.code
        when 200
          data = JSON.parse(response.body)
          data = data['camera_status']
          Camera.new data['camera_id'], data['name'], network_id, data['enabled'], data['wifi_strength']
        when 400...600
          throw Exception.new(response.body)
      end
    end

    def camera_signals

    end

    def enable_camera network_id, id
      @options = {
        headers: @headers
      }

      response = self.class.post("/network/#{network_id}/camera/#{id}/enable", @options)

      case response.code
        when 200
          self.bind_command JSON.parse(response.body)
        when 400...600
          throw Exception.new(response.body)
      end
    end

    def disable_camera network_id, id
      @options = {
        headers: @headers
      }

      response = self.class.post("/network/#{network_id}/camera/#{id}/disable", @options)

      case response.code
        when 200
          self.bind_command JSON.parse(response.body)
        when 400...600
          throw Exception.new(response.body)
      end
    end

    def command_status network_id, id
      @options = {
        headers: @headers
      }

      response = self.class.get("/network/#{network_id}/command/#{id}", @options)
      case response.code
        when 200
          self.bind_status JSON.parse(response.body)
        when 400...600
          throw Exception.new(response.body)
      end
    end

    def wait_for_command network_id, id
      max_retries = 10
      count = 0
      loop do 
        count += 1
        command = self.command_status network_id, id
        break if command.complete || count == max_retries 
        sleep 1
      end  
    end

    def homescreen

    end

    def events

    end

    def video

    end

    def videos_count

    end

    def videos_page

    end

    def video_info

    end

    def unwatched_videos

    end

    def delete_video

    end

    def delete_all_videos

    end

    def thumbnail

    end

    def capture_thumbnail

    end

    def clients

    end

    def regions

    end

    def health

    end

    def bind_status status

      commands = status['commands'].map do |command|
        self.bind_command command
      end

      Blink::Status.new status['complete'],
                        status['status'],
                        status['status_code'],
                        status['status_msg'],
                        commands
    end

    def bind_command command
      Blink::Command.new command['id'], 
                         command['created_at'], 
                         command['updated_at'], 
                         command['execute_time'], 
                         command['command'], 
                         command['stage_stage'], 
                         command['attempts']
    end
  end
end