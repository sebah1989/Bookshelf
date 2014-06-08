class Book < ActiveRecord::Base
  has_and_belongs_to_many :bookcases, join_table: 'bookcases_books'
  mount_uploader :cover_photo, CoverPhotoUploader
end
