module Gooru
  class Response
    attr_reader :data
    attr_reader :status

    def initialize(weary_response)
      @data = parse(weary_response.body)
      @status = weary_response.status
    end

    def error?
      has_error_key? ||
      internal_server_error?
    end

    def error_message
      if has_error_key?
        data["error"]
      elsif internal_server_error?
        data["status"]
      else
        ""
      end
    end

    def success?
      !error?
    end

  private

    def has_error_key?
      data.has_key?("error")
    end

    def internal_server_error?
      status == 500
    end

    def parse(body)
      if body.match(/^error:(.*)/)
        { "error" => Regexp.last_match[1] }
      else
        MultiJson.decode(body)
      end
    end

  end
end