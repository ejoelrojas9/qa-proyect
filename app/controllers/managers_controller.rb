class ManagersController < ApplicationController
  before_action :set_manager, only: %i[show edit update destroy]

  def index
    @managers = Manager.all.order(id: 'asc')
  end

  def show
    
  end

  def new
    
  end

  def create
    @manager = Manager.new manager_params
    if @manager.save
      flash[:notice] = "Manager created"
      redirect_to manager_path(@manager)
    else
      flash[:alert] = @manager.errors.full_messages.join(',')
    end
  end

  def edit
    
  end

  def update
    if @manager.update manager_params
      respond_to do |format|
        # format.html { redirect_to manager_path(@manager), notice: "Manager updated" }
        format.turbo_stream { render turbo_stream: turbo_stream.replace( "manager_show", partial: 'managers/show', locals: { manager: @manager } ) }
        # format.turbo_stream { render turbo_stream: turbo_stream.append( 'rooms',                   partial: 'shared/room',   locals: { room: @room } ) }
      end
    else
      format.html { render :edit }
      # flash[:alert] = @manager.errors.full_messages.join(',')
    end
  end

  def destroy
    if @manager.destroy
      redirect_to managers_path, alert: "Manager deleted"
    else
      flash[:alert] = @manager.errors.full_messages.join(',')
    end
  end

  private

  def set_manager
    @manager = Manager.find params[:id]
  end

  def manager_params
      params.require(:manager).permit(:first_name, :last_name, :notes, :email, :phone, :city, :age)
  end

end
