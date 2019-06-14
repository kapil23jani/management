# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

   protected
    def after_confirmation_path_for(resource_name, resource)
      token = resource.send(:set_reset_password_token)
      edit_password_url(resource, reset_password_token: token)
    end

end
