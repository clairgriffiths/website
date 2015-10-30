require 'rails_helper'

# Methods for logging in
  def create_user!
    @user = User.create(email: 'clair@example.co.uk', password: 'aaaaaaaa')
  end

 def log_in
	visit "/posts"
	click_link "SIGN IN"
  expect(page).to have_content("Log in")

  fill_in "Email", with: "clair@example.co.uk"
  fill_in "Password", with: "aaaaaaaa"
	 click_button "Log in"
 end



# Start of tests
# PROBLEM! Can't test upload of files. Capybara is trying to create a folder to save my image in, but Nitrous doesn't seem to want to let me
# CODEBAR

describe "Login" do
	before(:each) do
		create_user!
		log_in
	end
	
	describe "Create posts" do
		
		# Method to create a post (must stay within the describe block)
		def create_post(options={})
			options[:title] ||= "My new post"
			options[:category] ||= "Questions"

			visit '/'
			click_link "Add new post"
			fill_in "Title", with: options[:title]
			fill_in "Category", with: options[:category]
			click_button "Create Post"
		end
		
		
		it "Saves a post on success" do
			create_post
			expect(page).to have_content("My new post")
	  end


		it "Doesn't save post without title" do
			create_post title: ""
			expect(page).to have_content("error")
		end
	
		it "Doesn't save post without category" do
			create_post category: ""
			expect(page).to have_content("error")
		end

		it "Displays the correct slug" do
			create_post
			expect(title).to have_content "Coding with Clair | My new post"
		end

		it "Displays the correct date" do
			create_post
			expect(page).to have_content(Date.today)
		end

		it "Displays the sharing icons" do
			create_post
			expect(page).to have_content("Tweet")
		end

		it "Shows the new post on the post index page" do
			create_post
			click_link("Back to blog")
			expect(page).to have_content("My new post")
		end

	end
end


	 
	
