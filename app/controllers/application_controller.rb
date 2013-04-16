class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :gather_info

  def gather_info
  	@categorie = Category.all
  end
end
