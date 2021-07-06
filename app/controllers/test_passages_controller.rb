class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    if @test_passage.remaining_time <= 0
      @test_passage.accept!(params[:answer_ids])

      send_mail(@test_passage)

      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.accept!(params[:answer_ids])

      if @test_passage.completed?
        send_mail(@test_passage)

        BadgesService.new(@test_passage) if @test_passage.passed?

        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end
  end

  def send_mail(test)
    TestsMailer.completed_test(test).deliver_now
  end

  def gist
    response = GistQuestionService.new(@test_passage.current_question)
    response.call

    flash_options = if response.success?
                      gist = current_user.gists.create(gist_url: response.url, question: @test_passage.current_question)
                      { notice: t('.success', url: gist.gist_url) }
                    else
                      { notice: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
