class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy add_friend accept_request]
  before_action :set_notf, except: %i[sign_in]
  before_action :authenticate_user!

  # GET /users or /users.json
  def index
    @users = User.all.with_attached_avatar
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    s3_client = Aws::S3::Client.new(region: 'ap-southeast-2')
    bucket_name = 'odinfacebookbucket'
    key = "#{user.name} profile pic"
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

    respond_to do |format|
      if @user.save
        #@user.avatar.attach(params[:avatar])
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # These routes aren't very resourceful like...
  def add_friend
    current_user.send_request(@user)
    redirect_to @user, notice: "Request sent to #{@user.name}!" 
  end

  def accept_request
    record = Request.where(user_id: @user.id, friend_id: current_user.id)
    record.first.update(confirmed: true)
    redirect_to @user, notice: "Accepted #{@user.name}'s Request !" 
  end

  def notifications
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :avatar)
    end

    def set_notf
      @n1 = Request.got_any_requests?(current_user).length
    end
end


## class SessionsController < ApplicationController
##   def create
##     user = User.from_omniauth(env["omniauth.auth"])
##     session[:user_id] = user.id
##     redirect_to root_url
##   end
## 
##   def destroy
##     session[:user_id] = nil
##     redirect_to root_url
##   end
## end