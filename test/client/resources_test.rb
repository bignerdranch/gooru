require "test_helper"

class ResourcesTest < MiniTest::Unit::TestCase

  def test_search
    resources = Gooru::Client::Resources.new
    response = resources.get(
      query: "highgroove").perform

    assert(MultiJson.decode(response.body).has_key?("searchResults"))
  end

end