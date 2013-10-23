class User < ActiveRecord::Base
  attr_reader :password

  validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  validates :password, :length => { :minimum => 6, :message => "password must be at least 6 letters, fool!" }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end

end
