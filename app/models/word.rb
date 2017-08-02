class Word
  include Mongoid::Document
  field :word, type: String
  field :translate, type: String
  embedded_in :catalog
end
