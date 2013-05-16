require 'spec_helper'

describe "Static pages" do 
	subject{ page }
	describe "Home page" do
		before {visit root_path}
		it { should have_selector('h1', :text => "Shout") }
		it { should have_selector('title', :text => "Ruby on Rails") }
	end
	describe "About page" do
		before {visit about_path}
		it { should have_selector('h1', :text => "About") }
		it { should have_selector('title', :text => "| About") }
	end
	describe "Help page" do
		before {visit help_path}
		it "should have the h1 'Help'" do
			page.should have_selector('h1', :text => "Help")
		end
		it "should have the title 'Help'" do
			page.should have_selector('title', :text => "| Help")
		end
	end
	describe "Contact page" do
		before {visit contact_path}
		it "Should have the h1 'Contact" do
			page.should have_selector('h1', :text=>"Contact")
		end
		it "should have the title 'Contact'" do
			page.should have_selector('title', :text => "| Contact")
		end
	end
end