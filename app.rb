require "sinatra"
require "sinatra/reloader"
also_reload "lib/**/*.rb"
require "pg"
require "./lib/project"
require "./lib/volunteer"
require "pry"

DB = PG.connect({:dbname => 'volunteer_tracker_test'})



get('/new') do
	erb(:new)
end

get('/') do
	@list = Project.all
  	erb(:index)
end


post('/') do
@title = params.fetch("title")
project = Project.new(:title => @title, :id => nil)
project.save
redirect '/'
end

