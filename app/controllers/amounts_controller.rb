class AmountsController < ApplicationController
  
  def index
    @amounts = Amount.all
  end

  def show
  end

  # GET /immunizations/new
  def new
    @amount = Amount.new
  end

  
  def edit
  end

  
  def create
    @amount = Amount.new(amount_params)
    @amount.user = current_user

    respond_to do |format|
      if @amount.save
        format.html { redirect_to @amount, notice: 'amount was successfully created.' }
        format.json { render :show, status: :created, location: @amount }
      else
        format.html { render :new }
        format.json { render json: @amount.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @amount.update(amount_params)
        format.html { redirect_to @amount, notice: 'Amount was successfully updated.' }
        format.json { render :show, status: :ok, location: @amount }
      else
        format.html { render :edit }
        format.json { render json: @amount.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @amount.destroy
    respond_to do |format|
      format.html { redirect_to amounts_url, notice: 'Amount was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amount
      @amount = Amount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amount_params
      params.require(:amount).permit(:price, :purchase_id)
    end
end
