class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy, :addadmin, :removeadmin]
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
    sign_in @user
    redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def index
      @title = "All users"
    # @users = User.paginate(:page => params[:page])
      @users = User.search(params[:search])
  end


 # def show
 #   @user = User.find(params[:id])
 #   @title = @user.name
 # end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def search
    @user = User.search(params[:search])
  end

  def addadmin
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    @user.update_attributes(params[:user])
    @user.save
    flash[:notice] = "Successfully Given Admin Privileges"

    redirect_to users_path
  end


  def removeadmin
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    @user.update_attributes(params[:user])
    @user.save
    flash[:notice] = "Successfully Revoked Admin Privileges"

    redirect_to users_path
  end



    private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
