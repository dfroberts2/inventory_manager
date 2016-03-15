module SpecTestHelper
	def log_user_in(u)
	    visit login_path
	    fill_in('username', with: u.username)
	    fill_in('password', with: u.password)
	    click_button('Login')
  	end
end