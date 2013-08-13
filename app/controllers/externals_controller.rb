class ExternalsController < ApplicationController
  
  def index
    unless tester_signed_in? || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available If You Received a Testing Code, Please Sign In If You Have One"
      redirect_to new_tester_session_path
    else
      @tester = current_tester
      @external = @tester.external
      @sketch = @external.sketch
      @subject = @sketch.subject
      @user = @sketch.user
      attributes
      #parent method in Application Controller
      #returns @attributes hash
    end
  end

  def show
    @external = External.find(params[:id])
    @sketch = @external.sketch
    @user = @sketch.user
    unless (user_signed_in? && current_user == @user) || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available To The Owner Of This Sketch, Please Sign In If You Are The Owner"
      redirect_to new_user_session_path
    else
      @tester = @external.tester
      @internal = @tester.internal
      @subject = @external.subject
      attributes
      #parent method in Application Controller
      #returns @attributes hash
    end
  end

  def edit
    @external = External.find(params[:id])
    @tester = @external.tester
    unless (tester_signed_in? && current_tester == @tester) || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available If You Received a Testing Code, Please Sign In If You Have One"
      redirect_to new_tester_session_path
    else
      if @external.finalized?
        flash[:error] = "This Test Cannot Be Modified Once Finalized"
        redirect_to externals_path
      else
        @subject = @external.subject
        @sketch = @subject.sketch
        @user = @sketch.user
        attributes
        #parent method in Application Controller
        #returns @attributes hash
      end
    end
  end

  def update
    @external = External.find(params[:id])
    @tester = @external.tester
    unless (tester_signed_in? && current_tester == @tester) || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available If You Received a Testing Code, Please Sign In If You Have One"
      redirect_to new_tester_session_path
    else
      if @external.finalized?
        flash[:error] = "This Test Cannot Be Modified Once Finalized"
        redirect_to externals_path
      else
        @external.update_attributes(params[:external])
        @external.save
        if @external.finalized
          redirect_to externals_path
        else
          redirect_to edit_external_path(@external)
        end
      end
    end
  end
end
