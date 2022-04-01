class UsersController < ApplicationController

  # GET /users or /users.json
  def index
    @users = User.search(params['search']).paginate(page: params[:page], per_page: 10)
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_user_from_api
    User.delete_all
    response = self::getDataFromApi
    array_user = JSON.parse(response)
    error = false
    array_user['results'].each do |user|
      if !self::saveUser(user) 
        error = true        
      end
    end

    if !error
      respond_to do |format|
        format.html { redirect_to users_path, notice: "Atualizado" }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_path, notice: "Ocorreu um erro ao atualizar" }
      end
    end
  
  end

  private
    def getDataFromApi
      return RestClient.get "https://randomuser.me/api", {params: {results: 30, inc: 'gender, email, name, picture', nat: 'br', seed: 'giga', format: 'json'}}
    end

    def saveUser(user)
      @user = User.new
      @user.name_title = user['name']['title']
      @user.name_first = user['name']['first']
      @user.name_last = user['name']['last']
      @user.email = user['email']
      @user.gender = user['gender']
      @user.picture_large = user['picture']['large']
      @user.picture_medium = user['picture']['medium']
      
      response_upload_thumbnail = Cloudinary::Uploader.upload(user['picture']['thumbnail'])
      response_upload_medium = Cloudinary::Uploader.upload(user['picture']['medium'])
      response_upload_large = Cloudinary::Uploader.upload(user['picture']['large'])
      
      if response_upload_thumbnail
        @user.picture_thumbnail = response_upload_thumbnail['url'] 
      else
        @user.picture_thumbnail = user['picture']['thumbnail']
      end

      if response_upload_medium
        @user.picture_medium = response_upload_medium['medium'] 
      else
        @user.picture_medium = user['picture']['medium']
      end

      if response_upload_large
        @user.picture_large = response_upload_large['url'] 
      else
        @user.picture_large = user['picture']['large']
      end

      @user.save!

      return true
    
    end

end
