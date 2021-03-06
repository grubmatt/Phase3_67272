class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.active.alphabetical.paginate(page: params[:page]).per_page(10)
    @active_stores = Store.active.alphabetical
    @inactive_stores = Store.inactive.alphabetical
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @current_assignments = @store.assignments.current.by_employee
    @current_employees = Array.new
    @current_assignments.each do |assignment|
      @current_employees << assignment.employee
    end
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to store_path(@store), notice: "Successfully created #{@store.name}."
    else
      render action: 'new'
    end
  end

  def update
    if @store.update(store_params)
      redirect_to store_path(@store), notice: "Successfully updated #{@store.name}."
    else
      render action: 'edit'
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    redirect_to stores_url, notice: "Successfully removed #{@store.name} from the AMC system."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :street, :city, :state, :zip, :phone, :active)
    end
end
