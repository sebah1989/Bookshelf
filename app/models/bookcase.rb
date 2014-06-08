class Bookcase < ActiveRecord::Base
  has_and_belongs_to_many :books, join_table: 'bookcases_books'
  belongs_to :user
end
