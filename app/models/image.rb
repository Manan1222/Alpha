class Image < ActiveRecord::Base
  belongs_to :article
  attachment :file
end
