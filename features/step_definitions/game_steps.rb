Then /^I should see a new game form$/ do
  if page.respond_to? :should
    page.should have_content("New Game")
  else
    assert page.has_content?("New Game")
  end
end
