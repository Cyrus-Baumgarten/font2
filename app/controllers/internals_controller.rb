class InternalsController < ApplicationController
  
  def index
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

  def show
    @internal = Internal.find(params[:id])
    @tester = @internal.tester
    @external = @tester.external
    @subject = @internal.subject
    @sketch = @subject.sketch
    @user = @sketch.user
    attributes
      #parent method in Application Controller
      #returns @attributes hash
  end

  def edit
    @internal = Internal.find(params[:id])
    @tester = @internal.tester
    @subject = @internal.subject
    @sketch = @subject.sketch
    @user = @sketch.user
    attributes
      #parent method in Application Controller
      #returns @attributes hash
  end

  def update
    @internal = Internal.find(params[:id])
    @internal.update_attributes(params[:internal])
    @internal.save
    if @internal.finalized
      redirect_to internals_path
    else
      redirect_to edit_internal_path(@internal)
    end
  end

  def destroy
  end
end
