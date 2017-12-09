module Blink
  class Status
    attr_reader :complete, :status, :status_code, :status_msg, :commands

    def initialize complete, status, status_code, status_msg, commands
      @complete = complete
      @status = status
      @status_code = status_code
      @status_message = status_msg
      @commands = commands
    end
  end
end