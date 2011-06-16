Then /^I should see a new game form$/ do
  if page.respond_to? :should
    page.should have_content("New Game")
  else
    assert page.has_content?("New Game")
  end
end

Then /^I should see an empty grid$/ do
  if page.respond_to? :should
    page.should have_content("Tic-Tac-Tien")
  else
    assert page.has_content?("Tic-Tac-Tien")
  end
end
