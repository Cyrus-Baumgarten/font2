class SketchesController < ApplicationController
  
  def index
    unless user_signed_in? || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available To Users, Please Sign In Or Create An Account"
      redirect_to new_user_session_path
    else
      @user = current_user
      @sketches = @user.sketches.to_a
    end
  end

  def new
    unless user_signed_in? || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available To Users, Please Sign In Or Create An Account"
      redirect_to new_user_session_path
    end
  end

  def create
    unless user_signed_in? || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available To Users, Please Sign In Or Create An Account"
      redirect_to new_user_session_path
    else
      #checks to see if there is a name and an email, both are currently arbitrary and do not need validation
      if params[:make_sketch][:name].empty?
        flash.now[:error] = "Make Sure To Add A Name"
        render 'new'
      elsif params[:make_sketch][:email].empty?
        flash.now[:error] = "Make Sure To Add An Email Address"
        render 'new'
      else
        @user = current_user
        #first creates sketch and populates with given attributes
        @sketch = Sketch.new
        @sketch.user = @user
        @sketch.attribute1 = params[:make_sketch][:attribute1]
        @sketch.attribute2 = params[:make_sketch][:attribute2]
        @sketch.attribute3 = params[:make_sketch][:attribute3]
        @sketch.attribute4 = params[:make_sketch][:attribute4]
        @sketch.attribute5 = params[:make_sketch][:attribute5]
        @sketch.attribute6 = params[:make_sketch][:attribute6]
        @sketch.attribute7 = params[:make_sketch][:attribute7]
        @sketch.attribute8 = params[:make_sketch][:attribute8]
        @sketch.attribute9 = params[:make_sketch][:attribute9]
        #if the sketch passes validation then it will create a new subject object using the arbitrary values, then save the object, associate it to the sketch, then save the sketch 
        if @sketch.save
          @subject = Subject.new
          @subject.name = params[:make_sketch][:name]
          @subject.email = params[:make_sketch][:email]
          code = generator
          @subject.code = code
          @subject.password = code
          @subject.password_confirmation = code
          @subject.save
          @sketch.subject = @subject
          @sketch.save
          flash[:message] = "Sketch Successfully Created"    
          redirect_to @sketch
        else
          flash[:error] = "Something went wrong, make sure you fill out all nine fields with different words"
          render 'new'
        end
      end
    end
  end

  def show
    @sketch = Sketch.find(params[:id])
    @user = @sketch.user
    unless (user_signed_in? && current_user == @user) || (user_signed_in? && current_user.admin?)
      flash[:error] = "I'm sorry, This Information is Private, Please Sign in if You Are This User"
      redirect_to root_path
    else
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
  end

  def destroy
    @sketch = Sketch.find(params[:id])
    @user = @sketch.user
    unless (user_signed_in? && current_user == @user) || (user_signed_in? && current_user.admin?)
      flash[:error] = "I'm sorry, This Can Only be Done by The Owner, Please Sign in if You Are This User"
      redirect_to root_path
    else
      #deletes entire association tree
      if @sketch.internals.any?
        @internals = @sketch.internals.to_a
        @internals.each do |internal|
          internal.tester.destroy
          internal.destroy
        end
      end
      if @sketch.externals.any?
        @externals = @sketch.externals.to_a
        @externals.each do |external|
          external.destroy
        end
      end
      @subject = @sketch.subject
      @subject.destroy
      @sketch.destroy
      flash[:message] = "Sketch and All Associated Data Successfully Created"
      redirect_to sketches_path
    end
  end
end
