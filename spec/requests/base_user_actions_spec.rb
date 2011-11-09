require 'spec_helper'

describe 'Users base actions:' do

  it "should get start page" do
    visit '/'
    page.should have_content('Welcome')
  end
  
  it "should get registration page" do
    visit '/home'
    click_on 'Sign up'
    page.should have_content('Sign up')
  end
  
  it "should redirect to registration page" do
    visit '/adaptive_tests'
    page.should have_content('You need to sign in or sign up before continuing')
  end
  
  it 'user should successfuly register' do
    visit '/users/sign_up'
    fill_in 'user[email]', :with => 'example123@gmail.com'
    fill_in 'user[password]', :with => '123162'
    fill_in 'user[password_confirmation]', :with => '123162'
    click_button 'Sign up'
    page.should have_content('Welcome! You have signed up successfully')
  end
  
  describe 'for authentication user:' do
    before :each do
      visit '/users/sign_up'
      fill_in 'user[email]', :with => 'example123@gmail.com'
      fill_in 'user[password]', :with => 'foobar'
      fill_in 'user[password_confirmation]', :with => 'foobar'
      click_button 'Sign up'
    end
    
    it 'should get list tests' do
      visit '/adaptive_tests'
      page.should have_content('AdaptiveTests')
    end
    
    it 'should get profile page' do
      click_on 'Profile'
      page.should have_content('example123@gmail.com')
    end
    
    it 'should logout' do
      click_on 'Logout'
      page.should have_content('Welcome')
    end
    
    it 'should logout from the profile page' do
      click_on 'Profile'  #!!!!!!!!!!!!!!!!!!!!!FAIL!!!!!!!!!!!!!!!!!!!!
      click_on 'Logout'
      page.should have_content('Welcome')
    end
    
    it 'should deny access if user try view foreign profile' do
      click_on 'Home'#!!
      click_on 'Logout'# !!
      visit '/users/sign_up'
      fill_in 'user[email]', :with => 'example124@gmail.com'
      fill_in 'user[password]', :with => 'foobar'
      fill_in 'user[password_confirmation]', :with => 'foobar'
      click_button 'Sign up'
      visit user_path(1)
      page.should have_content('You have not permissions')
    end
    
  end
  
end
