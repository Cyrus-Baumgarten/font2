class ExternalsController < ApplicationController
  
  def index
    @tester = current_tester
    @external = @tester.external
    @sketch = @external.sketch
    @subject = @sketch.subject
    @user = @sketch.user
    attributes
      #parent method in Application Controller
      #returns @attributes hash
  end

  def show
    @external = External.find(params[:id])
    @tester = @external.tester
    @internal = @tester.internal
    @subject = @external.subject
    @sketch = @subject.sketch
    @user = @sketch.user
    attributes
      #parent method in Application Controller
      #returns @attributes hash
  end

  def edit
    @external = External.find(params[:id])
    @tester = @external.tester
    @subject = @external.subject
    @sketch = @subject.sketch
    @user = @sketch.user
    attributes
      #parent method in Application Controller
      #returns @attributes hash
  end

  def update
    @external = External.find(params[:id])
    @external.update_attributes(params[:external])
    @external.save
    if @external.finalized
      redirect_to externals_path
    else
      redirect_to edit_external_path(@external)
    end
  end
end
