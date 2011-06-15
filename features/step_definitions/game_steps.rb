Then /^I should see an empty board$/ do
  if page.respond_to? :should
    page.should have_content("")
  else
    assert page.has_content?("")
  end
end

Then /^I should not see an empty board$/ do
  if page.respond_to? :should
    page.should have_content("x")
  else
    assert page.has_content?("x")
  end
end