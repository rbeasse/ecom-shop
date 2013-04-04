class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :pst, :title

  has_many :clients
end
