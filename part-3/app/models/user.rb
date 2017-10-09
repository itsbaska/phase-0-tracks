class User < ActiveRecord::Base
  include BCrypt

  has_many :reviews
  has_many :restaurants

  validates :username, :first_name, :last_name, :email, presence: true
  validate :validate_password

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(plain_password)
    @raw_password = plain_password
    @password = Password.create(plain_password)
    self.encrypted_password = @password
  end

  def authenticate(plain_password)
    self.password == plain_password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end
end
