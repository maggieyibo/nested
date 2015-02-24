class Photo
  include Mongoid::Document
  field :url, type: String
  mount_uploader :photo, ListingPhotoUploader
  embedded_in :listing
end
