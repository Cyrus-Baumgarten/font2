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
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def generator
    a = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    output = []
    20.times do
    	output.push(rand(1..9).to_s)
      output.push(a[rand(1..26)])
    end
    output.join
  end

end
