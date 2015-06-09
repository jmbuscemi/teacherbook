class Parent < ActiveRecord::Base
  belongs_to :teacher
  validates :name, presence: true
  validates :email, presence: true
  validates :student, presence: true
  
end
