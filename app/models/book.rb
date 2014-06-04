class Book < ActiveRecord::Base
  belongs_to :bookcase
  mount_uploader :cover_photo, CoverPhotoUploader
end
