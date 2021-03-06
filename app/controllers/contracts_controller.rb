class ContractsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contract, only: %i[show accept finish make_rating rating]
  before_action :check_is_customer, only: %i[new create]

  # GET /contracts
  # GET /contracts.json
  def index
    if current_user.customer?
      @contracts = Contract.where(customer: current_user)
    else
      @contracts = Contract.where(ninja: current_user).or(Contract.where(ninja: nil))
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show; end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params.merge(customer: current_user))

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    respond_to do |format|
      if @contract.ninja_accept(current_user)
        format.html { redirect_to @contract, notice: 'Contract accpepted with successfully' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { redirect_to @contract, notice: 'Error contract is not open or ninja is not available' }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    respond_to do |format|
      if @contract.ninja_finish(current_user)
        format.html { redirect_to @contract, notice: 'Contract finished with successfully' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { redirect_to @contract, notice: 'Error contract is not finished' }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def make_rating; end

  def rating
    respond_to do |format|
      if @contract.customer_rating(current_user, params[:contract][:rating_value])
        format.html { redirect_to @contract, notice: 'Contract rating with successfully' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { redirect_to @contract, notice: 'Error contract not rating' }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contract
    @contract = Contract.find(params[:id])
  end

  def check_is_customer
    redirect_to contracts_path, notice: 'User is not customer' unless current_user.customer?
  end

  def check_is_ninja
    redirect_to contracts_path, notice: 'User is not ninja' unless current_user.ninja?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contract_params
    params.require(:contract).permit(:description, :service_type)
  end
end
