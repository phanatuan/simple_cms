class PagesController < ApplicationController
  
  before_action :find_subject #make sure loaded with the subject_id
  
  def index
    #@pages = Page.where(subject_id: subject.id) #Find the page with the corresponding subject_id equal to the subject.id passed
    @pages = @subject.pages.all
  end

  def show
    @page = Page.find(params[:id])
    @subjects = Subject.order('position ASC')
    @page_count = Page.count + 1
  end

  def new
    @page = Page.new(subject_id: @subject.id)
    @subjects = Subject.order('position ASC')
    @page_count = Page.count
  end

  def create
    @page = Page.create(page_params)
    if @page.save
      flash[:notice] = "Subject created successfully"
      redirect_to(action: 'index', subject_id: @subject.id)
    else 
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order('position ASC')
    @page_count = Page.count + 1
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @page.id, subject_id: @subject.id)
    else 
      @subjects = Subject.order('position ASC')
      @page_count = Page.count + 1
      render 'edit'
    end
  end 

  def delete
   @page = Page.find(params[:id])  
  end

  def destroy
    @page = Page.find(params[:id]).destroy
    flash[:notice] = "Deleted successfully, yeah!"
    redirect_to(action:'index', subject_id: @subject.id)
  end

  private
  
  def page_params 
    params.require(:page).permit(:name, :permalink, :position, :visible, :subject_id)
  end

  def find_subject
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end

end
