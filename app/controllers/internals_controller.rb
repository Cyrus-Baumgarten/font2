class InternalsController < ApplicationController
  
  def index
    @subject = current_subject
    @sketch = @subject.sketch
    @internals = @sketch.internals.to_a
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
    @subject = @internal.subject
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
    @internal = Internal.find(params[:id])
    @tester = @internal.tester
    @subject = @internal.subject
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
