module Gooru
  class Client
    class SignIn < Gooru::Client
      domain ENV["GOORU_URL"]
      
      post :post, "gooruapi/rest/account/signin.json" do |resource|
        resource.required \
          :apiKey,
          :password,
          :userName
      end

    end
  end
end