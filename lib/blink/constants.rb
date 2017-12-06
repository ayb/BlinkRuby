module Blink
  class Constants
      BASE = "https://rest.prde.immedia-semi.com"

      @@token

      def self.token
        @@token
      end

      def self.token=(value)
        @@token = value
      end

      def self.base_url
        BASE
      end
  end
end