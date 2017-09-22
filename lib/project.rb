class Project
  attr_reader(:title, :id)
  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end
  def save
    DB.exec("INSERT INTO projects(title, id) VALUES('#{@title}', #{@id});")
  end
end