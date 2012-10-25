module Gooru
  class Client
    class Resources < Gooru::Client
      domain ENV["GOORU_URL"]
      
      get :get, "gooru-search/rest/search/resource.json" do |resource|
        resource.required \
          :query

        resource.optional \
          :pageNum,
          :pageSize,
          :sessionToken
      end

    end
  end
end