class UploadDetail < ActiveRecord::Base

  attr_accessible :gross_revenue

  belongs_to :upload
end