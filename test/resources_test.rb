require "test_helper"

class ResourcesTest < MiniTest::Unit::TestCase

  def test_get
    response = Gooru::Resources.get(
      query: "all")

    assert(response.data.has_key?("searchResults"))
  end

  def test_get_with_pagination
    response = Gooru::Resources.get(
      query:    "all",
      pageNum:  2,
      pageSize: 5)

    assert(response.data["searchResults"].count == 5)
  end
end