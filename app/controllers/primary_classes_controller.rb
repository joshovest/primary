class PrimaryClassesController < ApplicationController
  def index
    @primary_classes = PrimaryClass.all(:order => :name)
  end

  def new
    @primary_class = PrimaryClass.new
  end

  def edit
    @primary_class = PrimaryClass.find(params[:id])
  end

  def create
    @primary_class = PrimaryClass.new(params[:primary_class])

    if @primary_class.save
      flash[:success] = "Primary class (#{@primary_class.name}) was successfully saved."
      redirect_to primary_classes_path
    else
      render "new"
    end
  end

  def update
    @primary_class = PrimaryClass.find(params[:id])

    if @primary_class.update_attributes(params[:primary_class])
      flash[:success] = "Primary class (#{@primary_class.name}) was successfully saved."
      redirect_to primary_classes_path
    else
      render "edit"
    end
  end

  def destroy
    @primary_class = PrimaryClass.find(params[:id])
    @primary_class.destroy

    redirect_to primary_classes_path, success: "Primary class (#{@primary_class.name}) was successfully deleted."
  end
end
