class PeopleController < ApplicationController
  def index
    @people = Person.all
  end
  
  def show
    @people = Person.find(params[:id])
  end

  def new
    @people = Person.new
  end

  def create
    @people = Person.new(people_params)

    if @people.save
      redirect_to people_path
    else
      render :new
    end
  end

  def edit
    @people = Person.find(params[:id])
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to people_path
  end

  private

  def people_params
      params.require(:person).permit(:name, :age, :hair_color, :eye_color, :gender, :ethnicity, :alive)
  end
end