class Teacher < ActiveRecord::Base
  has_secure_password
  has_many :parents
  validates :name, presence: true
  validates :email, presence: true
  
end
