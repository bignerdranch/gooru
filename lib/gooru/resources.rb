module Gooru
  class Resources < Gooru::Request

  private

    def self.client
      Gooru::Client::Resources
    end

  end
end