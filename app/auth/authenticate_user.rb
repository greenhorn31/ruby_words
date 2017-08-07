class AuthenticateUser

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :password

  def user
    user = User.find_by(email: email)
   # return user if user && user.authenticate(password)
    return user if user

    #errors.add :user_authentication, 'invalid credentials'
    nil
  end
end