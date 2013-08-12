class ExternalsController < ApplicationController
  
  def index
    @tester = current_tester
    @external = @tester.external
    @sketch = @external.sketch
    @subject = @sketch.subject
    @user = @sketch.user
    @attributes = {
      1 => @sketch.attribute1,
      2 => @sketch.attribute2,
      3 => @sketch.attribute3,
      4 => @sketch.attribute4,
      5 => @sketch.attribute5,
      6 => @sketch.attribute6,
      7 => @sketch.attribute7,
      8 => @sketch.attribute8,
      9 => @sketch.attribute9 }
  end

  def show
    @external = External.find(params[:id])
    @tester = @external.tester
    @subject = @external.subject
    @sketch = @subject.sketch
    @user = @sketch.user
    @attributes = {
      1 => @sketch.attribute1,
      2 => @sketch.attribute2,
      3 => @sketch.attribute3,
      4 => @sketch.attribute4,
      5 => @sketch.attribute5,
      6 => @sketch.attribute6,
      7 => @sketch.attribute7,
      8 => @sketch.attribute8,
      9 => @sketch.attribute9 }
  end

  def edit
    @external = External.find(params[:id])
    @tester = @external.tester
    @subject = @external.subject
    @sketch = @subject.sketch
    @user = @sketch.user
    @attributes = {
      1 => @sketch.attribute1,
      2 => @sketch.attribute2,
      3 => @sketch.attribute3,
      4 => @sketch.attribute4,
      5 => @sketch.attribute5,
      6 => @sketch.attribute6,
      7 => @sketch.attribute7,
      8 => @sketch.attribute8,
      9 => @sketch.attribute9 }
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
