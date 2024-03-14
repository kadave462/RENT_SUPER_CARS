class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def mycars
    @usercars = current_user.cars
  end

  def index
    if user_signed_in?
      @cars = Car.where.not(user_id: current_user.id)
    else
      @cars = Car.all
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:car_model,:car_brand,:price,:horse_power)
  end
end
