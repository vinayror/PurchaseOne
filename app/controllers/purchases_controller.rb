class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @purchases = Purchase.all
    respond_with(@purchases)
  end

  def show
    respond_with(@purchase)
  end

  def new
    @purchase = Purchase.new
    respond_with(@purchase)
  end

  def edit
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id
    if @purchase.save
      flash[:notice] = 'Purchase was successfully created.' 
      respond_with(@purchase)
    end
  end

  def update
    flash[:notice] = 'Purchase was successfully updated.' if @purchase.update(purchase_params)
    respond_with(@purchase)
  end

  def destroy
    @purchase.destroy
    respond_with(@purchase)
  end

  private
    def set_purchase
      @purchase = Purchase.friendly.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:date, :title, :user_id, amounts_attributes: [:id, :price, :purchase_id,:_destroy])
    end
end
