class Word
  include Mongoid::Document
  field :word, type: String
  field :translate, type: String
  embedded_in :catalog

  def as_json(*args)
    res = super
    res["id"] = res.delete("_id").to_s
    res
  end
end
