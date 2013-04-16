class StoreController < ApplicationController
  def index
  	@new_products = Product.limit(5).order('created_at DESC')
    @updated_products = Product.limit(5).order('updated_at DESC')
  end

  def search
  	@product_searched_for = params[:product]
  	@products = Product.where("title LIKE ?" ,"%#{@product_searched_for}%").page(params[:page]).per(5)
  end

  def category
  	@category_id = params[:id]
  	@products = Product.where(category_id: @category_id).page(params[:page]).per(5)
  	@category = Category.find(@category_id)
  end

  def about
    @page = Page.find(1)
    @page_content = BlueCloth.new(@page.content).to_html
  end

  def contact
    @page = Page.find(2)
    @page_content = BlueCloth.new(@page.content).to_html
  end

end
