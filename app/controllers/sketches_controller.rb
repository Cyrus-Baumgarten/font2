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
    #creates an array of internal objects that are marked final
    @completedinternals = []
    @completedinternalcount = 0
    @internals.each do |internal|
      if internal.finalized?
        @completedinternals.push(internal)
        @completedinternalcount += 1
      end
    end
    #adds up each attributes values and divides them by completed tests to find average and store in variable
    @internal_attribute_1_total = 0
    @internal_attribute_2_total = 0
    @internal_attribute_3_total = 0
    @internal_attribute_4_total = 0
    @internal_attribute_5_total = 0
    @internal_attribute_6_total = 0
    @internal_attribute_7_total = 0
    @internal_attribute_8_total = 0
    @internal_attribute_9_total = 0
    
    @completedinternals.each do |internal|
       @internal_attribute_1_total += internal.attribute1size
       @internal_attribute_2_total += internal.attribute2size
       @internal_attribute_3_total += internal.attribute3size
       @internal_attribute_4_total += internal.attribute4size
       @internal_attribute_5_total += internal.attribute5size
       @internal_attribute_6_total += internal.attribute6size
       @internal_attribute_7_total += internal.attribute7size
       @internal_attribute_8_total += internal.attribute8size
       @internal_attribute_9_total += internal.attribute9size
    end
    
    if @completedinternalcount > 0
      @internal_attribute_1_mean = @internal_attribute_1_total / @completedinternalcount
      @internal_attribute_2_mean = @internal_attribute_2_total / @completedinternalcount
      @internal_attribute_3_mean = @internal_attribute_3_total / @completedinternalcount
      @internal_attribute_4_mean = @internal_attribute_4_total / @completedinternalcount
      @internal_attribute_5_mean = @internal_attribute_5_total / @completedinternalcount
      @internal_attribute_6_mean = @internal_attribute_6_total / @completedinternalcount
      @internal_attribute_7_mean = @internal_attribute_7_total / @completedinternalcount
      @internal_attribute_8_mean = @internal_attribute_8_total / @completedinternalcount
      @internal_attribute_9_mean = @internal_attribute_9_total / @completedinternalcount
    end
    
    #creates an array of external objects that are marked as final
    @completedexternals = []
    @completedexternalcount = 0
    @externals.each do |external|
      if external.finalized?
        @completedexternals.push(external)
        @completedexternalcount += 1
      end
    end
    @external_attribute_1_total = 0
    @external_attribute_2_total = 0
    @external_attribute_3_total = 0
    @external_attribute_4_total = 0
    @external_attribute_5_total = 0
    @external_attribute_6_total = 0
    @external_attribute_7_total = 0
    @external_attribute_8_total = 0
    @external_attribute_9_total = 0
    
    @completedexternals.each do |external|
       @external_attribute_1_total += external.attribute1size
       @external_attribute_2_total += external.attribute2size
       @external_attribute_3_total += external.attribute3size
       @external_attribute_4_total += external.attribute4size
       @external_attribute_5_total += external.attribute5size
       @external_attribute_6_total += external.attribute6size
       @external_attribute_7_total += external.attribute7size
       @external_attribute_8_total += external.attribute8size
       @external_attribute_9_total += external.attribute9size
    end
    
    if @completedexternalcount > 0
      @external_attribute_1_mean = @external_attribute_1_total / @completedexternalcount
      @external_attribute_2_mean = @external_attribute_2_total / @completedexternalcount
      @external_attribute_3_mean = @external_attribute_3_total / @completedexternalcount
      @external_attribute_4_mean = @external_attribute_4_total / @completedexternalcount
      @external_attribute_5_mean = @external_attribute_5_total / @completedexternalcount
      @external_attribute_6_mean = @external_attribute_6_total / @completedexternalcount
      @external_attribute_7_mean = @external_attribute_7_total / @completedexternalcount
      @external_attribute_8_mean = @external_attribute_8_total / @completedexternalcount
      @external_attribute_9_mean = @external_attribute_9_total / @completedexternalcount
    end
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
