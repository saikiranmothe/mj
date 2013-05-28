class UsersController < ApplicationController
  skip_before_filter :login_required, :only => [:home, :sign_up, :create, :registration_ack, :create_password, :store_password, :reset_password, :update_password, :demo_family, :search]
 # before_filter :already_logged_in
  skip_before_filter :already_logged_in, :only => [:search, :index, :edit_profile]
  
  def index
    @users = User.all(:conditions => ['id > ?',params[:begin]], :limit => 30)
    @begin = @users.last.id
  end

  def sign_up

  end

  def create
    params[:user][:firstname] = params[:user][:firstname].upcase
    params[:user][:lastname] = params[:user][:lastname].upcase
    params[:user][:station] = params[:user][:station].upcase
    @user = User.new(params[:user])
    if @user.save
      redirect_to "/users/registration_ack/#{@user.id}"
    else
      render 'new'
    end
  end

  def login_page

  end

  def home
    
  end

  def registration_ack
    @user = User.find(params[:id])
    # @user.reqstatus = true
    # @user.save
    @user.update_attribute(:reqstatus, false)
    UserMailer.welcome_email(@user).deliver
  end

  def store_password
    @user = User.find(params[:id])
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.password_salt = BCrypt::Engine.generate_salt
      @user.password_hash = BCrypt::Engine.hash_secret(params[:user][:password], @user.password_salt)
      @user.save
      UserMailer.complete_registration_email(@user,params[:user][:password]).deliver
    else
      redirect_to "/users/create_password/#{@user.id}", :notice => 'passwords are not equal'
    end
  end

  def accept_request
    @user = User.find(params[:id])
    @user.update_attribute(:reqstatus, false)
    UserMailer.welcome_email(@user).deliver
    redirect_to "/sessions/login_page/#{@user.user_id}", :notice => 'Mail has been sent to '+@user.firstname
  end

  def decline_request
    @user = User.find(params[:id])
    @user.update_attribute(:reqstatus, false)
    redirect_to "/sessions/login_page/#{@user.user_id}"
  end

  def create_password
      @user = User.find(params[:id])
      unless @user.password_hash.nil?
        redirect_to "/login", :notice => 'user already exists! please login to continue'
      end
      mj_id = "MJ" + "#{@user.id}"
      @user.update_column(:mj_id,mj_id)
  end

  def show
    @user = User.find(params[:id])
  end

  def reset_password
    @user = User.find(params[:id])
    mj_id = "MJ" + "#{@user.id}"
    @user.update_column(:mj_id,mj_id)
  end

  def update_password
    @user = User.find(params[:id])
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.password_salt = BCrypt::Engine.generate_salt
      @user.password_hash = BCrypt::Engine.hash_secret(params[:user][:password], @user.password_salt)
      @user.save
      UserMailer.new_password_email(@user,params[:user][:password]).deliver
    else
      redirect_to "/users/reset_password/#{@user.id}", :notice => 'Passwords are not equal !'
    end
  end

  def edit_profile
    @user = User.find(params[:id])    
  end

  def search

  end

  def demo_family
    @user = User.find(2)
  end
end
