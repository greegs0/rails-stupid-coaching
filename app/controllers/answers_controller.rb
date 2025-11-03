class AnswersController < ApplicationController
  def answer
    @user_input = params[:answer]
    @response = coach_answer_enhanced(@user_input)
  end

  private

  def coach_answer(your_message)
    return "Good news and let me alone !" if your_message == "I am going to work right now!"
    return "Silly question, get dressed and go to work!" if your_message[-1] == "?"
    "I don't care, get dressed and go to work!"
  end

  def coach_answer_enhanced(your_message)
    is_up = your_message == your_message.upcase && your_message.match?(/[A-Z]/)
    return "Good news sorry !" if your_message == "I AM GOING TO WORK RIGHT NOW!"
    base = coach_answer(your_message)
    is_up ? "I can feel your motivation! #{base}" : base
  end
end
