module Gooru
  class Client < Weary::Client
    domain "http://concept.goorulearning.org/"

    post :sign_in, "gooruapi/rest/account/signin.json" do |resource|
      resource.required :apiKey, :password, :userName
    end
  end
end