class InternalsController < ApplicationController
  
  def index
    unless subject_signed_in? || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available If You Received a Testing Code, Please Sign In If You Have One"
      redirect_to new_subject_session_path
    else
      @subject = current_subject
      @sketch = @subject.sketch
      @internals = @sketch.internals.to_a
      @user = @sketch.user
      attributes
      #parent method in Application Controller
      #returns @attributes hash
      @completedcount = 0
      @internals.each do |internal|
        if internal.finalized?
          @completedcount += 1
        end
      end
    end
  end

  def show
    @internal = Internal.find(params[:id])
    @sketch = @internal.sketch
    @user = @sketch.user
    unless (user_signed_in? && current_user == @user) || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available To The Owner Of This Sketch, Please Sign In If You Are The Owner"
      redirect_to new_user_session_path
    else
      @tester = @internal.tester
      @subject = @internal.subject
      @external = @tester.external
      attributes
      #parent method in Application Controller
      #returns @attributes hash
    end
  end

  def edit
    @internal = Internal.find(params[:id])
    @subject = @internal.subject
    unless (subject_signed_in? && current_subject == @subject) || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available If You Received a Testing Code, Please Sign In If You Have One"
      redirect_to new_subject_session_path
    else
      if @internal.finalized?
        flash[:error] = "This Test Cannot Be Modified Once Finalized"
        redirect_to internals_path
      else
        @tester = @internal.tester
        @sketch = @subject.sketch
        @user = @sketch.user
        attributes
        #parent method in Application Controller
        #returns @attributes hash
      end
    end
  end

  def update
    @internal = Internal.find(params[:id])
    @subject = @internal.subject
    unless (subject_signed_in? && current_subject == @subject) || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available If You Received a Testing Code, Please Sign In If You Have One"
      redirect_to new_subject_session_path
    else
      if @internal.finalized?
        flash[:error] = "This Test Cannot Be Modified Once Finalized"
        redirect_to internals_path
      else
        @internal.update_attributes(params[:internal])
        @internal.save
        if @internal.finalized
          redirect_to internals_path
        else
          redirect_to edit_internal_path(@internal)
        end
      end
    end
  end
end
