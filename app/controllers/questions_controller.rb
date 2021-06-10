class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.map { |question| "<p>#{question.body}</p>" }
    render html: questions.join.html_safe
  end

  def show
    render html: @question.body.html_safe
  end

  def new; end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def destroy
    if @question.delete
      redirect_to test_path(@question.test)
    else
      render plain: 'The question not deleted'
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Test was not found'
  end
end
