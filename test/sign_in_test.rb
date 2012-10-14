require "test_helper"

class SignInTest < MiniTest::Unit::TestCase

  def test_post
    response = Gooru::SignIn.post(
      apiKey:   ENV["GOORU_API_KEY"],
      userName: ENV["GOORU_USER_NAME"],
      password: ENV["GOORU_PASSWORD"])
    
    assert(response.data.has_key?("token"))
  end

  def test_unsuccessful_post
    response = Gooru::SignIn.post(
      apiKey:   "invalid-api-key",
      userName: "invalid-username",
      password: "invalid-password")
    
    assert(response.data.has_key?("error"))
  end

end