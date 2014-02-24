class SectionsController < ApplicationController

  before_action :find_page

  def index
    #@sections = Section.where()
    @sections = @page.sections.all
  end

  def show
    @section = Section.find(params[:id])
    @pages = Page.all
  end

  def new
    @section = Section.new({name:'default', page_id: @page.id})
    @pages = Page.all
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      redirect_to(action: 'index', page_id: @page.id)
    else 
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.all
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section was updated succesfully yeah!"
      redirect_to(:action =>'show', :id => @section.id, page_id: @page.id) 
    else  
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Delete #{@section.name} sucecessufully" 
    redirect_to(:action => 'index',page_id: @page.id)
  end

  private 
  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content, :page_id)
  end
  
  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end

 
end
