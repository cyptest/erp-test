class ProductsController < ApplicationController
    
    before_filter :only => [:index, :edit, :show, :update, :new, :create, :register, :destroy]

    def index
        @products = Product.paginate(:page => params[:page])
        @productsearch = Product.search(params[:search])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def show
        @product = Product.find(params[:id])  
    end

    def update
        @product = Product.find(params[:id])
        if @product.update_attributes(params[:product])
            redirect_to root_path
        else
            render "edit"
        end
    end

    def new
        @product  = Product.new
        @title = "Add product"
    end

    def create
        @product = Product.new(params[:product])
        if @product.save
            redirect_to root_path, :flash => { :success => "Add product is ok!" }
        else
            @title = "Add product"
            render 'new'
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to root_path, :flash => { :success => "product deleted!" }
    end			
end
