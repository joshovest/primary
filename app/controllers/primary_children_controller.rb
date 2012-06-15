class PrimaryChildrenController < ApplicationController
  layout "directory", :only => [ "directory" ]
  
  def index
    @primary_children = PrimaryChild.all
  end
  
  def directory
    sort = params[:sort] == "class" ? "birthday,last_name,first_name" : "last_name,first_name,birthday"
    oldest_class = PrimaryClass.maximum("age")
    youngest_class = PrimaryClass.minimum("age")
    max_birthday = Time.new(Time.now.year-oldest_class, 12, 31)
    min_birthday = Time.new(Time.now.year-youngest_class, 12, 31)
    
    @primary_children = PrimaryChild.where(:birthday => (max_birthday..min_birthday)).order(sort)
  end

  def new
    @primary_child = PrimaryChild.new
  end

  def edit
    @primary_child = PrimaryChild.find(params[:id])
  end

  def create
    @primary_child = PrimaryChild.new(params[:primary_child])
    
    if @primary_child.save
      # save photo
      if !params[:upload_file].nil?
        @path = save_file(params[:upload_file][:filename], (@primary_child.first_name + " " + @primary_child.last_name))
      end
      
      flash[:success] = "Primary child (#{@primary_child.first_name} #{@primary_child.last_name}) was successfully saved."
      redirect_to primary_children_path
    else
      render "new"
    end
  end

  def update
    @primary_child = PrimaryChild.find(params[:id])
    
    if @primary_child.update_attributes(params[:primary_child])
      if !params[:upload_file].nil?
        @path = save_file(@primary_child.id.to_s + ".jpg")
      end
      
      flash[:success] = "Primary child (#{@primary_child.first_name} #{@primary_child.last_name}) was successfully saved."
      redirect_to primary_children_path
    else
      render "edit"
    end
  end

  def destroy
    @primary_child = PrimaryChild.find(params[:id])
    @primary_child.destroy
    
    flash[:success] = "Primary child (#{@primary_child.first_name} #{@primary_child.last_name}) was successfully deleted."
    redirect_to primary_children_path
  end
  
  def save_file(filename)
    require 'fileutils'
  
    tmp = params[:upload_file][:filename].tempfile
    file = File.join("public/photos", filename)
    FileUtils.cp tmp.path, file
    
    filename
  end
end
