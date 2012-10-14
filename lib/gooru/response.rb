module Gooru
  class Response
    attr_reader :data

    def initialize(weary_response)
      @data = parse(weary_response.body)
    end

    def success?
      data.has_key?("error") == false
    end

  private

    def parse(body)
      if body.match(/^error:(.*)/)
        { "error" => Regexp.last_match[1] }
      else
        MultiJson.decode(body)
      end
    end

  end
end