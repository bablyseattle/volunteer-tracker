class Volunteer
  attr_reader(:name, :project_id, :id)
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def ==(another_volunteer)
    self.name == another_volunteer.name 
  end

  def self.all
    records = DB.exec("SELECT * FROM volunteers")
    list = []
    records.each do | record|
      name = record.fetch("name")
      id = record.fetch("id").to_i
      project_id = record.fetch("project_id")
      list.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    list
  end

  def save
    result = DB.exec("INSERT INTO volunteers(name, project_id) VALUES('#{@name}',#{project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    records = DB.exec("SELECT * FROM volunteers WHERE id = #{id};")
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