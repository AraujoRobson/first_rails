class PeopleController < ApplicationController
  before_action :set_person, only: [:update, :destroy, :show, :edit]

  def index
    @people = Person.all
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to person_url(@person), notice: "Pessoa criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)
      redirect_to person_url(@person), notice: "Pessoa atualizada com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy

    redirect_to people_url, notice: "Pessoa removida com sucesso!"
  end

  def show; end

  def new
    @person = Person.new
  end

  def edit; end

  private

  def person_params
    params.require(:person).permit(:name, :age, :city)
  end

  def set_person
    @person = Person.find(params[:id])
  end
end
