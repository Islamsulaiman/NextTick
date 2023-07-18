class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, only: [:show, :edit, :update, :destroy]
  
    def index
      @projects = current_user.projects.all
    end
  
    def show
    end

    def new
        @category = Category.find_by(id: params[:category_id])
        @project = Project.new
    end


      # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
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
        params.require(:project).permit(:name, :user_id, :category_id).merge(user_id: current_user.id)
      end
  end