require "test_helper"

class ResourcesTest < MiniTest::Unit::TestCase

  def test_get
    response = Gooru::Resources.get(
      query: "highgroove")

    assert(response.data.has_key?("searchResults"))
  end

end