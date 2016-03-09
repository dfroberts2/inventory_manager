require 'spec_helper'
require 'rails_helper'
include SpecTestHelper

feature "User browsing the application" do
	context "Visit pages not logged in" do
		it "Sees the login page when visiting root path" do
			visit '/'
			expect(page).to have_field('username')
			expect(page).to have_field('password')
		end
	end

	context "Visit pages logged in" do
		it "Sees the root page when logged in" do
			u = FactoryGirl.create(:user)
			log_user_in(u)
			visit '/'
			expect(page).to have_selector("select.owner-select")
		end

		it "Can navigate to business inventory index page", js:true do
			u = FactoryGirl.create(:user)
			b = FactoryGirl.create(:business)
			log_user_in(u)
			find(:select, from, options).find(:option, value, options).select_option
			visit '/owners/'+b.owner.id.to_s+'/businesses/'+b.id.to_s
			expect(page).to have_selector("select.year-select")
		end

		# it "Can navigate to inventory show page" do
			# u = FactoryGirl.create(:user)
		end
	end
end