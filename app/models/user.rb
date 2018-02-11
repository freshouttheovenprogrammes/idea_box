class User < ApplicationRecord
  validates_presence_of :email, :password, :full_name
  validates :email, uniqueness: { case_sensitive: false,
                    message: "Sorry there is a user already registered with that email" }
  def self.authenticate(email, password)
  end

end
