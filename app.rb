require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "pg"
require "./lib/project"
require "./lib/volunteer"
require "pry"

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get('/') do
  erb(:index)
end

post('/projects') do
	@title = params.fetch("title")
	project = project.new(:name => @title, :id => nil)
	project.save
	@list = Project.all
	erb(:projects)
end