require 'spec_helper'
require 'rails_helper'
include SpecTestHelper
include WaitForAjax

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
			expect(page).to have_current_path(root_path)
		end

		it "Can navigate to business show page", js:true do
			u = FactoryGirl.create(:user)
			b = FactoryGirl.create(:business)
			log_user_in(u)
			select(b.owner.name, :from => 'owner')
			wait_for_ajax
			click_link(b.name)
			expect(page).to have_current_path(owner_business_path(b, b.owner))
		end

		# it "Can navigate to inventory show page" do
			# u = FactoryGirl.create(:user)
		# end
	end
end