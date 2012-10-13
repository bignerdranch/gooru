require "test_helper"

class SignInTest < MiniTest::Unit::TestCase

  def test_sign_in
    sign_in = Gooru::Client::SignIn.new
    response = sign_in.post(
      apiKey:   ENV["GOORU_API_KEY"],
      userName: ENV["GOORU_USER_NAME"],
      password: ENV["GOORU_PASSWORD"]).perform

    assert(MultiJson.decode(response.body).has_key?("token"))
  end

  def test_invalid_sign_in
    sign_in = Gooru::Client::SignIn.new
    response = sign_in.post(
      apiKey:   "invalid-api-key",
      userName: "invalid-username",
      password: "invalid-password").perform

    assert(response.body.match(/^error/))
  end

end