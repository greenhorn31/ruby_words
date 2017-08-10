class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String


  index({ email: 1 } , { unique: true })

  has_secure_password
  embeds_many :catalogs

end
