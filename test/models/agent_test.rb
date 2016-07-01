require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  test "should be able to call office_mls" do
    assert "142246", agents(:one).office_mls
  end
  test "should be able to call its own mls" do
    assert "881383", agents(:one).mls
  end
end
