class SketchesController < ApplicationController
  
  def index
    @user = current_user
    @sketches = @user.sketches.to_a
  end

  def new
  end

  def create
    @user = current_user
    #first creates new test subject using name and email address
    @subject = Subject.new
    @subject.name = params[:make_sketch][:name]
    @subject.email = params[:make_sketch][:email]
    code = generator
    @subject.code = code
    @subject.password = code
    @subject.password_confirmation = code
    @subject.save
    #then creates new sketch and associates both the current(creating) user and the new (temporary)subject
    @sketch = Sketch.new
    @sketch.user = @user
    @sketch.subject = @subject
    @sketch.attribute1 = params[:make_sketch][:attribute1]
    @sketch.attribute2 = params[:make_sketch][:attribute2]
    @sketch.attribute3 = params[:make_sketch][:attribute3]
    @sketch.attribute4 = params[:make_sketch][:attribute4]
    @sketch.attribute5 = params[:make_sketch][:attribute5]
    @sketch.attribute6 = params[:make_sketch][:attribute6]
    @sketch.attribute7 = params[:make_sketch][:attribute7]
    @sketch.attribute8 = params[:make_sketch][:attribute8]
    @sketch.attribute9 = params[:make_sketch][:attribute9]
    @sketch.save    
    redirect_to @sketch
  end

  def show
    @sketch = Sketch.find(params[:id])
    @user = @sketch.user
    @subject = @sketch.subject
    @externals = @sketch.externals.to_a
    @internals = @sketch.internals.to_a
    
    internal_means
      #parent method in Application Controller
      #returns
        #@completedinternals, an array of completed internal test objects
        #@completedinternalcount, an integer of the amount of completed internal tests
        #@internal_attribute_(n)_mean, an integer of the mean of all test results for the sketches attribute(n)
    external_means
      #parent method in Application Controller
        #returns same values as internal_means, just for externals
          #@completedexternals
          #@completedexternalcount
          #@external_attribute_(n)_mean
    
  end

  def edit
  end

  def update
  end

  def destroy
    @sketch = Sketch.find(params[:id])
    @subject = @sketch.subject
    @subject.destroy
    @sketch.destroy
    redirect_to sketches_path
  end

end
