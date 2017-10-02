require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# Your project should be set up so that a volunteer can only be created if a project already exists. (This makes it easier to assign the one to many relationship in Sinatra.) Focus on getting one integration spec passing at a time.

# The user should be able to visit the home page and fill out a form to add a new project. When that project is created, the application should direct them back to the homepage.

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to form where they can create a project' do
    visit '/new'
    fill_in('title', :with => 'creating online website')
    click_button('Create Project')
    expect(page).to have_content('creating online website')
  end
end
# A user should be able to click on a project to see its detail. The detail page includes a form where the project can be updated. When the form is submitted, the user can be directed to either the home page or that project's detail page. (The test will work for either.)

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the project' do
    test_project = Project.new({:title => 'creating online website', :id => nil})
    test_project.save
    visit '/'
    click_link('creating online website')
    fill_in('title', :with => 'creating game')
    click_button('Update project')
    expect(page).to have_content('creating game')
  end
end

# A user should be able to nagivate to a project's detail page and delete the project. The user will then be directed to the index page. The project should no longer be on the list of projects.

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a project' do
    test_project = Project.new({:title => 'creating online website', :id => nil})
    test_project.save
    visit '/'
    click_link('creating online website')
    click_button('Delete project')
    visit '/'
    expect(page).not_to have_content("creating online website")
  end
end
