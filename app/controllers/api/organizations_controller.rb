module Api
  class OrganizationsController < ApplicationController
    def create
      organization = current_user.organizations.new(organization_params)

      if organization.save
        render json: organization
      else
        render json: organization.errors.full_messages, status: :unprocessable_entity
      end
    end

    private

    def organization_params
      params
        .require(:organization)
        .permit(:name, :description, teams_attributes: [:id, :name, :description, :_destroy])
    end
  end
end
