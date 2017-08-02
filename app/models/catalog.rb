class Catalog
  include Mongoid::Document
  field :name, type: String
  embeds_many :words
end
