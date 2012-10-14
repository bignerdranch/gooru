module Gooru
  class Request

    def self.get(options = {})
      response = client.new.get(options).perform
      Gooru::Response.new(response)
    end

    def self.post(options = {})
      response = client.new.post(options).perform
      Gooru::Response.new(response)
    end

  private

    def self.client
      raise NotImplementedError
    end

  end
end