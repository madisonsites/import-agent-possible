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
  test "should strip html tags" do
    agents(:one).description = "<p>Lou is a CPA in the City of Chicago&mdash;so getting his own broker&rsquo;s license and building a realty practice has been a natural progression.&nbsp;Lou thoroughly understands his clients&rsquo; goals.</p><p>He received an MBA in Finance &amp; Business Policy from the University of Chicago. Lou speaks three languages, owing to his Cuban heritage and his wife&rsquo;s Brazilian roots. Lou has kids ranging from 11 months to 24 years &mdash;while the oldest is a third year medical student, the youngest is just learning to walk!Lou finds that the most rewarding part of being a Dream Town real estate agent is helping someone find their new&mdash;possibly first&mdash;home where they, too, can escape to their personal oasis.</p>"
    agents(:one).save
    assert_equal "Lou is a CPA in the City of Chicago—so getting his own broker’s license and building a realty practice has been a natural progression. Lou thoroughly understands his clients’ goals.He received an MBA in Finance & Business Policy from the University of Chicago. Lou speaks three languages, owing to his Cuban heritage and his wife’s Brazilian roots. Lou has kids ranging from 11 months to 24 years —while the oldest is a third year medical student, the youngest is just learning to walk!Lou finds that the most rewarding part of being a Dream Town real estate agent is helping someone find their new—possibly first—home where they, too, can escape to their personal oasis.",
                agents(:one).description
  end
end
