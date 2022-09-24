class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i[ show update destroy ]

  def index
    render json: @project.tickets.all
  end

  def show
    render json: @ticket
  end

  def create
    @ticket = @project.tickets.build(ticket_params)

    if @ticket.save
      render json: @ticket, status: :created, location: [ @project, @ticket ]
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket.destroy
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_ticket
      @ticket = @project.tickets.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:name, :description)
    end
end
