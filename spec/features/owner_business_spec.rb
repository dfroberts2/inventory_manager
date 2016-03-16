require 'spec_helper'
require 'rails_helper'
include SpecTestHelper
include WaitForAjax
include ResponsiveHelpers

feature "Owner/Business navigation" do
	context	"Creates owner" do
		before(:each) do
			u = FactoryGirl.create(:user)
			log_user_in(u)
			visit '/'
		end
		it "Completes new owner form in desktop", js: true do
			find('#desktop-new-owner').click
			fill_in('owner_name', :with => 'Test Owner')
			find('input[name="commit"]').click
			expect(page).to have_select("owner", with_options: ["Test Owner"])
		end

		it "Completes new owner form in desktop", js: true do
			resize_window_to_mobile
			find('#mobile-new-owner').click
			fill_in('owner_name', :with => 'Test Owner')
			find('input[name="commit"]').click
			expect(page).to have_select("owner", with_options: ["Test Owner"])
		end
	end

	context "New owner features" do
		before(:each) do 
			u = FactoryGirl.create(:user)
			log_user_in(u)
			visit '/'
			find('#desktop-new-owner').click
			fill_in('owner_name', :with => 'Test Owner')
			find('input[name="commit"]').click
		end

		it "Sees select business section", js: true do
			select('Test Owner', :from => 'owner')
			wait_for_ajax
			expect(page).to have_content('Select Business:')
		end

		it "Completes new business form in mobile for new owner", js: true do
			resize_window_to_mobile
			select('Test Owner', :from => 'owner')
			wait_for_ajax
			find('#mobile-new-business').click
			fill_in('business_name', :with => 'Test Business Name')
			fill_in('business_address',  :with => Faker::Address.street_address)
			fill_in('business_city',  :with => Faker::Address.city)
			fill_in('business_state',  :with => Faker::Address.state_abbr)
			fill_in('business_phone',  :with => Faker::PhoneNumber.phone_number)
			find('input[name="commit"]').click
			select('Test Owner', :from => 'owner')
			wait_for_ajax
			expect(page).to have_content('Test Business Name')

		end

		it "Completes new business form in desktop for new owner", js: true do
			select('Test Owner', :from => 'owner')
			wait_for_ajax
			find('#desktop-new-business').click
			fill_in('business_name', :with => 'Test Business Name')
			fill_in('business_address',  :with => Faker::Address.street_address)
			fill_in('business_city',  :with => Faker::Address.city)
			fill_in('business_state',  :with => Faker::Address.state_abbr)
			fill_in('business_phone',  :with => Faker::PhoneNumber.phone_number)
			find('input[name="commit"]').click
			select('Test Owner', :from => 'owner')
			wait_for_ajax
			expect(page).to have_content('Test Business Name')
		end
	end
end