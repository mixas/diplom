require 'spec_helper'

describe 'close tests:' do
  before :each do
    visit '/users/sign_up'
    fill_in 'user[email]', :with => 'example123@gmail.com'
    fill_in 'user[password]', :with => 'foobar'
    fill_in 'user[password_confirmation]', :with => 'foobar'
    click_button 'Sign up'
  end
  
  #!!!!!!!!!
  it 'should get test' do
    click_on 'Home'
    click_on 'Tests'
    page.should have_content('AllTests')
  end
  
end
