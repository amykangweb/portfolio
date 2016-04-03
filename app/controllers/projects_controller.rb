class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :check_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to root_path
    else
      flash.now[:error] = "Project could not be saved."
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project was successfully destroyed."
    redirect_to projects_path
  end

  private
    def check_user
      unless current_user.editor?
        redirect_to root_path
      end
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :technologies_used, :description, :thumbnail, :image, :extra, :site, :source)
    end
end
