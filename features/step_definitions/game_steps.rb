Then /^I should see a new game form$/ do
  if page.respond_to? :should
    page.should have_content("Human")
  else
    assert page.has_content?("Human")
  end
end

Then /^I should see an empty grid$/ do
  if page.respond_to? :should
    page.should have_no_content("x")
  else
    assert page.has_no_content?("x")
  end
end

Then /^I should see a non\-empty grid$/ do
  if page.respond_to? :should
    page.should have_content("x")
  else
    assert page.has_content?("x")
  end
end

Given /^a new game$/ do
    visit path_to("the home page")
    select("Human", :from => "player_one")
    select("Human", :from => "player_two")
    click_button("Start New Game")
end

Then /^there should be the following user$/ do |table|
  user = User.last
  table.hashes.each do |user_hash|
    user_hash["Login"].should == user.login
    user_hash["Email"].should == user.email
  end
end

Given /^the following users:$/ do |table|
  User.delete_all
  table.hashes.each do |user_hash|
    options = {:login => user_hash["login"],
               :password => user_hash["password"],
               :password_confirmation => user_hash["password"],
               :email => user_hash["email"]}
    @user = User.create!(options)
  end
end
