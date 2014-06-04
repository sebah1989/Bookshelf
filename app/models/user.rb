class User < ActiveRecord::Base
  has_secure_password
  has_one :bookcase
  has_many :books, through: :bookcase

  validates_uniqueness_of :email
  validates_presence_of :email
end
