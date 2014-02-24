class SubjectsController < ApplicationController
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count + 1
  end

  def new
    @subject = Subject.new({name: 'default'})
    @subject_count = Subject.count + 1
  end

  def create 
    #Instantiate the new object using form parameters
    @subject = Subject.new(subject_params)
    #Save the object
    if @subject.save
      #If Object save OK, redirect to the index
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
    else 
    #If Object save not OK, redisplay the form so the user can fill in again
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update 
    #Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      #If Update OK, redirect to the index
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else 
    #If Update save not OK, redisplay the form so the user can fill in again
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  private 
    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
  
end
