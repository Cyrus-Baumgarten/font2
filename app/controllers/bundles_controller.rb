class BundlesController < ApplicationController
  
  def new
    unless subject_signed_in? || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available If You Received a Testing Code, Please Sign In If You Have One"
      redirect_to new_subject_session_path
    else
      @subject = current_subject
      @sketch = @subject.sketch
      @user = @sketch.user
    end
  end

  def make
    unless subject_signed_in? || (user_signed_in? && current_user.admin?)
      flash[:error] = "This Feature Is Only Available If You Received a Testing Code, Please Sign In If You Have One"
      redirect_to new_subject_session_path
    else
      @subject = current_subject
      @sketch = @subject.sketch
      @user = @sketch.user
      #loops fifteen times to create up to 15 different testers, internals, and externals and associates them to eachother
      (1..15).each do |index|
        #turns loop index into symbol to it can access params hash
        name_string = "name#{index}"
        email_string = "email#{index}"
        name = name_string.to_sym
        email = email_string.to_sym
        code = generator
        #checks to see if there is a name and an email, both are currently arbitrary and do not need validation, this also lets the bundle run without causing errors in the middle
        #loop allows for user to input UP TO 15 names but does no require all fields to be filled out
        unless params[:bundle][email].empty? || params[:bundle][name].empty?
          #creates a new devise tester model
          @tester = Tester.new
          @tester.name = params[:bundle][name]
          @tester.email = params[:bundle][email]
          @tester.code = code
          @tester.password = code
          @tester.password_confirmation = code
          if index <= 5
            @tester.relationship = "subordinate"
          elsif index > 5 && index <= 10
            @tester.relationship = "peer"
          else
            @tester.relationship = "superior"
          end
          #creates a new internal test and associates the sketch, tester and subject
          @internal = Internal.new
          @internal.subject = @subject
          @internal.tester = @tester
          @internal.sketch = @sketch
          @internal.number = index
          @internal.finalized = false
          @internal.save
          #and does the same for the external
          @external = External.new
          @external.subject = @subject
          @external.tester = @tester
          @external.sketch = @sketch
          @external.number = index
          @external.finalized = false
          @external.save
        end
      end
    end
    redirect_to internals_path
  end  
end
