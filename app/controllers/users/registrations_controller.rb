# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    puts 'HEELLLLOOOW'
    UserMailer.with(user: current_user).welcome_email.deliver_now
    puts ' HEYEEE   '
    s3_client = Aws::S3::Client.new(region: 'ap-southeast-2')
    bucket_name = 'odinfacebookbucket'
    key = "#{@user.name} profile pic"
    content = @user.avatar
    def object_uploaded?(s3_client, bucket_name, object_key, object_content)
      response = s3_client.put_object(
        bucket: bucket_name,
        key: key,
        body: content
      )
      if response.etag
        return true
      else
        return false
      end
    rescue StandardError => e
        puts "Error uploading object: #{e.message}"
        return false
    end
    object_uploaded?(s3_client, bucket_name, key, content)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
