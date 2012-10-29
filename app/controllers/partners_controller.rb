class PartnersController < ApplicationController
    before_filter :only => [:index, :edit, :show, :update, :new, :create, :destroy]

    def index
        @partners = Partner.paginate(:page => params[:page])
        @partnersearch = Partner.search(params[:search])
    end 

    def edit
        @partner = Partner.find(params[:id])
    end

    def show
        @partner = Partner.find(params[:id])
        @productsearch = Product.search(params[:search])
        @productsearchadd = Product.search(params[:search])
    end

    def update
        @partner = Partner.find(params[:id])
        if @partner.update_attributes(params[:partner])
            redirect_to root_path
        else
            render "edit"
        end
    end

    def new
        @partner  = Partner.new
        @title = "Add partner"
    end

    def create
        @partner = Partner.new(params[:partner])
        if @partner.save
            redirect_to root_path, :flash => { :success => "Add partner is ok!" }
        else
            @title = "Add partner"
            render 'new'
        end
    end

    def destroy
        @partner = Partner.find(params[:id])
        @partner.destroy
        redirect_to root_path, :flash => { :success => "partner deleted!" }
    end		
end
