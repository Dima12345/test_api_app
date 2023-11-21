class V1::AssignmentsController < ApplicationController
  def index
    assignments = Assignment

    if params[:owner_id].present? && params[:owner_type].present?
      assignments = assignments.by_owner(params[:owner_id], params[:owner_type])
    end
    assignments = assignments.page(default_page).per(default_per_page)
    render json: AssignmentSerializer.new(assignments).serializable_hash
  end

  def show
    assignment = Assignment.find(params[:id])
    render json: AssignmentSerializer.new(assignment).serializable_hash
  end

  def create
    assignment = Assignment.create!(assignment_params)
    render json: AssignmentSerializer.new(assignment).serializable_hash
  end
  
  def update
    assignment = Assignment.find(params[:id])
    assignment.update(assignment_params)
    render json: AssignmentSerializer.new(assignment).serializable_hash
  end

  private

  def assignment_params
    params
      .require(:assignment)
      .permit(
        :month,
        :rnd_percentage,
        :project_id,
        :owner_id,
        :owner_type
      )
  end
end
