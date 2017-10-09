require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "pg"
require "./lib/project"
require "./lib/volunteer"
require "pry"

DB = PG.connect({:dbname => 'volunteer_tracker'})


get('/') do
	@list = Project.all
  	erb(:index)
end

get('/new') do
	erb :new
end

get('/all_volunteers') do
	@list = Volunteer.all
	erb :volunteers
end


post('/projects') do
@title = params.fetch("title")
project = Project.new(:title => @title, :id => nil)
project.save
redirect '/'
end

get('/:id') do
	@project = Project.find(params[:id])
	@list = @project.volunteers
	erb :projects
end

delete('/:id/delete') do
	@project = Project.find(params[:id].to_i)
	@project.delete
	redirect '/'
end

patch('/:id/edit') do
	@project = Project.find(params[:id].to_i)
	title = params["title"]
	@project.update(:title => title)
	redirect back
end

post('/add_volunteer') do
	name = params["name"]
	project_id = params.fetch("project_id")
	volunteer = Volunteer.new(:name => name, :id => nil, :project_id => project_id)
	volunteer.save
	redirect back
end





