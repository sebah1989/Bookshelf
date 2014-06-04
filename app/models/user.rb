class User < ActiveRecord::Base
  has_secure_password
  has_one :bookcase
  has_many :books, through: :bookcase
  after_create :create_user_bookcase

  validates_uniqueness_of :email
  validates_presence_of :email

  private
    def create_user_bookcase
      create_bookcase({ name: "#{email}'s bookshelf" })
    end
end
