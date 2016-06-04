require 'spec_helper'
require 'rails_helper'
include SpecTestHelper
include WaitForAjax
include ResponsiveHelpers

feature "Inventory" do
	context	"Creates new inventory" do
		before(:each) do
			u = FactoryGirl.create(:user)
			log_user_in(u)
			b = FactoryGirl.create(:business)
			visit(owner_business_path(b, b.owner))
		end
		it "Creates new inventory in desktop view", js: true do
			find('#desktop-new-inventory').click
			date = Faker::Time.between(DateTime.now - 1, DateTime.now)
			date_format = date.strftime("%m%d")
			fill_in('inventory_date', :with => date_format)
			find('input[name="commit"]').click
			expect(page).to have_select("inventory-year", with_options: [date.year])
		end

		it "Creates new inventory in desktop view", js: true do
			resize_window_to_mobile
			find('#mobile-new-inventory').click
			date = Faker::Time.between(DateTime.now - 1, DateTime.now)
			date_format = date.strftime("%m%d")
			fill_in('inventory_date', :with => date_format)
			find('input[name="commit"]').click
			expect(page).to have_select("inventory-year", with_options: [date.year])
		end
	end
	describe "Inventory show page functionality" do
		before(:each) do
			u = FactoryGirl.create(:user)
			log_user_in(u)
			i = FactoryGirl.create(:inventory)
			visit inventory_path(i)
		end
		context "Category scanner" do
			it "Adds new category scanner in desktop view" do
				find(:xpath,"//div[contains(@class,'hidden-xs') and contains(@class,'category')]//a[.='Add Scanner']").click
				expect(page).to have_content('Edit Scanner')
			end
			it "Deletes new category scanner in desktop view" do
				find(:xpath,"//div[contains(@class,'hidden-xs') and contains(@class,'category')]//a[.='Add Scanner']").click
				find(:xpath,"//div[contains(@class,'hidden-xs') and contains(@class,'category')]//a[.='Delete']").click
				expect(page).to_not have_content('Edit Scanner')
			end

			it "Adds new category scanner in mobile view" do
				find(:xpath,"//div[contains(@class,'hidden-md') and contains(@class,'category')]//a[.='Add Scanner']").click
				expect(page).to have_content('Edit Scanner')
			end
			it "Deletes new category scanner in mobile view" do
				find(:xpath,"//div[contains(@class,'hidden-md') and contains(@class,'category')]//a[.='Add Scanner']").click
				find(:xpath,"//div[contains(@class,'hidden-md') and contains(@class,'category')]//a[.='Delete']").click
				expect(page).to_not have_content('Edit Scanner')
			end
		end

		context "UPC scanner" do
			it "Adds new category scanner in desktop view" do
				find(:xpath,"//div[contains(@class,'hidden-xs') and contains(@class,'upc')]//a[.='Add Scanner']").click
				expect(page).to have_content('Edit Scanner')
			end
			it "Deletes new category scanner in desktop view" do
				find(:xpath,"//div[contains(@class,'hidden-xs') and contains(@class,'upc')]//a[.='Add Scanner']").click
				find(:xpath,"//div[contains(@class,'hidden-xs') and contains(@class,'upc')]//a[.='Delete']").click
				expect(page).to_not have_content('Edit Scanner')
			end

			it "Adds new category scanner in mobile view" do
				find(:xpath,"//div[contains(@class,'hidden-md') and contains(@class,'upc')]//a[.='Add Scanner']").click
				expect(page).to have_content('Edit Scanner')
			end
			it "Deletes new category scanner in mobile view" do
				find(:xpath,"//div[contains(@class,'hidden-md') and contains(@class,'upc')]//a[.='Add Scanner']").click
				find(:xpath,"//div[contains(@class,'hidden-md') and contains(@class,'upc')]//a[.='Delete']").click
				expect(page).to_not have_content('Edit Scanner')
			end
		end
		context "Previous and next inventory buttons" do
			it "Previous inventory button goes back one inventory"
			b = FactoryGirl.create(:business)
			b.inventories.create()
		end
	end
end