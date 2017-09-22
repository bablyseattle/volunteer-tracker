class Project
  attr_reader(:title, :id)
  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO projects(title) VALUES('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(another_project)
    self.title == another_project.title 
  end

  def self.all
    records = DB.exec("SELECT * from projects")
    list = []
    records.each do | record|
      title = record.fetch("title")
      id = record.fetch("id")
      list.push(Project.new({:title => title, :id => id}))
    end
    list
  end
end