class Catalog
  include Mongoid::Document

  field :name, type: String

  embeds_many :words
  embedded_in :user


  def as_json(*args)
    res = super
    res["id"] = res.delete("_id").to_s
    res
  end


end
