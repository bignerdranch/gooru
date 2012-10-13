require "test_helper"

class AuthenticationTest < MiniTest::Unit::TestCase

  def test_a_client_can_sign_in
    client = Gooru::Client.new
    response = client.sign_in(
      apiKey:   ENV["GOORU_API_KEY"],
      userName: ENV["GOORU_USER_NAME"],
      password: ENV["GOORU_PASSWORD"]).perform

    assert(MultiJson.decode(response.body).has_key?("token"))
  end

  def test_a_client_can_recover_from_invalid_sign_in
    client = Gooru::Client.new
    response = client.sign_in(
      apiKey:   "invalid-api-key",
      userName: "invalid-username",
      password: "invalid-password").perform

    assert(response.body.match(/^error/))
  end

end