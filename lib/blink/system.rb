module Blink
  class System
    attr_reader :token, :email, :password, :networks

    def initialize email, password
      @email = email
      @password = password
    end
  end
end
