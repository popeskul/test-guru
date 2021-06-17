class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[ show update result ]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      send_mail(@test_passage)
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def send_mail(test)
    TestsMailer.completed_test(test).deliver_now
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
