class FamilyMembersController < ApplicationController
  before_filter :already_logged_in
  skip_before_filter :already_logged_in, :only => [:family, :create_family, :admin_family, :add_family, :update_payment, :print_tree, :edit_relationship, :update_relation, :delete_member]

  def index
    @family_members = FamilyMember.all
  end

  def show
    @family_member = FamilyMember.find(params[:id])
  end

  def new
    @family_member = FamilyMember.new
  end

  def edit
    @family_member = FamilyMember.find(params[:id])
  end

  def create
    @family_member = FamilyMember.new(params[:family_member])
    @family_member.save
    redirect_to @family_member, notice: 'Family member was successfully created.'
  end

  def update
    @family_member = FamilyMember.find(params[:id])
    @family_member.update_attributes(params[:family_member])
    redirect_to @family_member, notice: 'Family member was successfully updated.'
  end

  def destroy
    @family_member = FamilyMember.find(params[:id])
    @family_member.destroy
    redirect_to family_members_url
  end

  def family
    @user = User.find(params[:id])
    @all_relations = Relation.all(:order => 'priority')
    @family_members = FamilyMember.find_all_by_family_member_user_id_and_join_pending(@user.id,true)
    @fm = FamilyMember.find_all_by_user_id_and_join_pending(@family_member_user_id, false)
    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
      format.json { render :json => @user }
    format.pdf do
      render :pdf => "family"
    end
    end
  end

  def create_family
    @user = User.find(params[:id])
  end

  def add_family
    unless params[:relation] == "0"
      @user = User.find_by_mj_id(params[:search_mjid])
      unless @user.nil? or @user.blank?
        @fm = FamilyMember.find_by_user_id_and_family_member_user_id(current_user.id, @user.id)
        if @fm.nil? or @fm.blank?
          @f = FamilyMember.new
          @f.relation_id = params[:relation]
          @f.family_member_user_id = @user.id
          @f.user_id = @current_user.id
          @f.join_pending = false
          @f.save
          redirect_to "/family_members/family/#{current_user.id}", :notice => "#{@user.firstname} #{@user.lastname} added."
        else
          redirect_to "/family_members/family/#{current_user.id}", :notice => "#{@user.firstname} #{@user.lastname} already exists."
        end
      else
        redirect_to "/family_members/family/#{params[:id]}", :notice => "User does not exist."
      end
    else
      redirect_to "/family_members/family/#{params[:id]}", :notice => "Select a relation."
    end
    #@pending_members = FamilyMember.find_all_by_join_pending(true)
  end

  def join_pending
    @j = FamilyMember.find_by_id(params[:id])
    @j.update_attributes(:join_pending => false)
    @user = User.find(@j.user_id)
    @user.update_attributes(:family_count => @user.family_count + 1)
    @fm = FamilyMember.new
    @fm.relationship = "<" + @j.relationship + ">"
    @fm.family_member_user_id = @j.user_id
    @fm.user_id = @j.family_member_user_id
    @fm.save
    redirect_to "/family_members/family/#{@j.family_member_user_id}"
  end

  def join_decline
    @j = FamilyMember.find_by_id(params[:id])
    @j.destroy
    redirect_to "/family_members/family/#{@j.family_member_user_id}"
  end

  def admin_family
    @user = User.find(params[:id])
    @due_members = FamilyMember.find_all_by_payment_status_and_join_pending_and_user_id(false, false,params[:id])
    @paid_members = FamilyMember.find_all_by_payment_status_and_join_pending_and_user_id(true, false,params[:id])
  end

  def update_payment
    if params.include? "paid"
      params[:paid].each do |key,val|
        paid_user = FamilyMember.find_by_id(key)
        paid_user.update_attributes(:payment_status => true)
      end
      @user = User.find(params[:id])
      @due_members = FamilyMember.find_all_by_payment_status_and_join_pending_and_user_id(false, false,params[:id])
      @paid_members = FamilyMember.find_all_by_payment_status_and_join_pending_and_user_id(true, false,params[:id])
      @user.update_attributes(:payment => (@paid_members.count + 1) * 100)
      @user.update_attributes(:due => @due_members.count * 100)
      redirect_to "/family_members/admin_family/#{@user.id}"
    end
  end

  def deactivate
    @f = FamilyMember.find_by_id(params[:id])
    @f.update_attributes(:deactivate => true )
  end

  def print_tree
    @user = User.find(params[:id])
    @family_members = FamilyMember.find_all_by_family_member_user_id_and_join_pending(@user.id,true)
  end

  def delete_member
    @family_member = FamilyMember.find(params[:id])
    @family_member.destroy
    redirect_to "/family_members/family/#{current_user.id}", :notice => "Relationship deleted."
  end

end