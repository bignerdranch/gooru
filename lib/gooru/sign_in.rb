module Gooru
  class SignIn < Gooru::Request

  private

    def self.client
      Gooru::Client::SignIn
    end

  end
end
