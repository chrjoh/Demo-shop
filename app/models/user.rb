require 'digest/sha1'

class User < ActiveRecord::Base
  validates_presence_of    :name
  validates_uniqueness_of  :name

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validate :password_not_blank

  def self.authenticate(name,password)
    user = self.find_by_name(name)
    if user
      ep = encrypted_password(password,user.salt)
      if user.hashed_password != ep
        user = nil
      end
    end
    user
  end

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    puts "password = " + @password.to_s
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password,self.salt)
  end

  private

  def password_not_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end

  def create_new_salt
    self.salt = self.object_id.to_s << rand.to_s
  end

  def self.encrypted_password(password,salt)
    new_string = password+salt
    Digest::SHA1::hexdigest(new_string)
  end
end
