class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    authorize @project, :is_editor?
  end

  def create
    @project = Project.new(project_params)
    authorize @project, :is_editor?
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash.now[:error] = "Project could not be saved."
      render :new
    end
  end

  def edit
    authorize @project, :is_editor?
  end

  def update
    authorize @project, :is_editor?
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @project, :is_editor?
    @project.destroy
    flash[:notice] = "Project was successfully destroyed."
    redirect_to projects_path
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :technologies_used, :description, :thumbnail, :image, :extra, :site, :source)
    end
end
