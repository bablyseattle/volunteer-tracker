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
    records = DB.exec("SELECT * FROM projects")
    list = []
    records.each do | record|
      title = record.fetch("title")
      id = record.fetch("id").to_i
      list.push(Project.new({:title => title, :id => id}))
    end
    list
  end

  def self.find(id)
    records = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    list = []
    records.each do | record|
      title = record.fetch("title")
      id = record.fetch("id").to_i
      list.push(Project.new({:title => title, :id => id}))
    end
    list[0]
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @id = self.id
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE from projects where id = #{self.id};")
  end

  def volunteers
    records = DB.exec("SELECT * from volunteers where project_id = #{self.id};")
    list = []
    records.each do | record|
      name = record.fetch("name")
      id = record.fetch("id").to_i
      project_id = record.fetch("project_id")
      list.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    list
  end
end