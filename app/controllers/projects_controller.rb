class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: [:show, :edit, :update, :destroy]
  
    def index
      @projects = current_user.projects.all
    end
  
    def show
    end
  
    def new
      @project = current_user.projects.build
    end
  
    def edit
    end
  
    def create
        #link our newly created project with it's correspondin user
      @project = current_user.projects.build(project_params)
      
      @project = current_user.projects.build(project_params)
  
      if @project.save
        redirect_to @project, notice: 'Project was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @project.update(project_params)
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @project.destroy
      redirect_to projects_url, notice: 'Project was successfully destroyed.'
    end
  
    private
      def set_project
        @project = current_user.projects.find(params[:id])
      end
  
      def project_params
        params.require(:project).permit(:name, :user_id, :category_id)
      end
  end