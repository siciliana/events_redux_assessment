class User < ActiveRecord::Base
  # attr_reader :password

  has_many :created_events, class_name: "Event"
  has_many :attended_events, through: :event_attendances, source: :event
  has_many :event_attendances

  validates :first_name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  validates :password, :length => { :minimum => 6, :message => "password must be at least 6 letters, fool!" }
  validates :email, :presence => true
  validates :email, :uniqueness => true
  # validates :email #, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "please enter a valid email address." }
  validates :password_digest, :presence => true

  # validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end

end
