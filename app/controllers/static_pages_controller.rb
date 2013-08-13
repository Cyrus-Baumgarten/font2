class StaticPagesController < ApplicationController
  def landing
  end

  def home
    if user_signed_in?
      redirect_to sketches_path
    elsif subject_signed_in?
      @subject = current_subject
      @sketch = @subject.sketch
      if @sketch.internals.any?
        redirect_to internals_path
      else
        redirect_to bundle_path
      end
    elsif tester_signed_in?
      redirect_to externals_path
    else
      redirect_to landing_path
    end
  end

  def index
  end
end
