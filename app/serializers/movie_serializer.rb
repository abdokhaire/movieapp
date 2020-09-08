class MovieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug, :description, :director, :year
  has_many :reviews
  has_many :actors
  has_many :locations
end
