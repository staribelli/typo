Given /^the blog has an editor user$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'editor',
                :password => 'aaaaaaaa',
                :email => 'joe@snow.com',
                :profile_id => 2,
                :name => 'editor',
                :state => 'active'})
end

And /^I am logged in as an editor into the admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'editor'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end


Then /^I should see the input "(.*?)" with label "(.*?)"$/ do |arg1, arg2|
  field = find_field("#{arg1}")
  f2 = find_by_id(arg1)
end

Then /^I should not see the input "(.*?)" with label "(.*?)"$/ do |arg1, arg2|
  page.should have_no_field(arg1)
end
