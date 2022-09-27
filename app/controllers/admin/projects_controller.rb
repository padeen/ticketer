class Admin::ProjectsController < Admin::ApplicationController
  before_action :set_project, only: [ :update, :destroy ]

  def create
     @project = Project.new(project_params)

     if @project.save
      render json: @project, status: :created, location: @project
     else
      render json: @project.errors, status: :unprocessable_entity
     end
  end

  def update
    if @project.update(project_params)
      render json: @purchase
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
