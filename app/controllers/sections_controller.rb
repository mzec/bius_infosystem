class SectionsController < ApplicationController
  load_and_authorize_resource

  def index
    @sections = Section.all
    if @sections.empty?
      flash[:notice] = "No sections in database."
    end
    respond_to do |format|
      format.html
      format.xml { render :xml => @sections.to_xml }
    end
  end  

  def search
    @sections = []
    if params[:keyword]
      params[:keyword] = '%' + params[:keyword] + '%'
      @sections = Section.where(["title ILIKE ?", params[:keyword]])
      if @sections.empty?
        flash[:notice] = "No such sections in database."
      end
    end
  end

  def show
    @section = Section.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @section.to_xml }
    end
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "Section was successfully created."
      redirect_to sections_url
    else
      render "new"
    end
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      flash.now[:notice] = "Section was successfully updated."
      redirect_to section_url(@section)
    else
      render "edit"
    end
  end

  def destroy
    @section = Section.find(params[:id])
    if @section.destroy
      flash[:notice] = "Section was successfully deleted."
      redirect_to sections_url
    end
  end

end
