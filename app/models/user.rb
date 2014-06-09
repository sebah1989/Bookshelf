class User < ActiveRecord::Base
  has_secure_password
  has_one :bookcase
  has_many :books, through: :bookcase
  before_create :set_admin
  after_create :create_user_bookcase

  validates :email, presence: true, uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  private
    def create_user_bookcase
      create_bookcase({ name: "#{email}'s bookshelf" })
    end

    def set_admin
      self.admin = true if User.all.empty?
    end
end
