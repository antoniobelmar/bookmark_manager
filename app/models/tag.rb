class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  #belongs_to :link
  has n, :links, through: Resource
end
