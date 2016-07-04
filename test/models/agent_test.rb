require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  test "should be able to call office_mls" do
    assert "142246", agents(:one).office_mls
  end
  test "should be able to call its own mls" do
    assert "881383", agents(:one).mls
  end
  test "should not allow invalid email" do
    bad_emails = ["madison", "madison@", "madison.com"]
    agent = Agent.new(mls: "123456")
    bad_emails.each do |bad_email|
      agent.email = bad_email
      assert_equal true, agent.invalid?
    end
  end
end
