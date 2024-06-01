# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resources, options={})
    if resources.persisted?
      render json: {
        status: { code: 200, message: "Signed up succesfully", data: resource }
      }, status: :ok
    else

      render json: {
        status: {message: 'User could not be created successfully.', errors: resource.errors.full_messages }, status: :unprocessable_entity
      }

    end
  end
end
