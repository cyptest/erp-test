class SearchController < ApplicationController
  # autocomplete :product, :name, :full => true

  # Sunspot search.
  def index
    @search = Product.search do
      fulltext params[:search]
      paginate(:per_page => 1, :page => params[:page])
    end
    @products = @search.results
  end
end