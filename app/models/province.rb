class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :pst, :title
  validates :gst, :hst, :pst, :title, presence: true
  has_many :clients
end
