class TestPassage < ApplicationRecord
  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_question
  before_update :set_passed
  before_create :set_starting_time

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end

    save
  end

  def passed?
    result >= SUCCESS_RATE
  end

  def result
    (self.correct_question.to_f / questions_count) * 100
  end

  def questions_count
    test.questions.count
  end

  def current_question_index
    test.questions.index(current_question) unless completed?
  end

  def remaining_time
    (self.test.passage_time - (Time.current - self.created_at).seconds).to_i
  end

  private

  def set_question
    if self.current_question.present?
      self.current_question = next_question
    else
      self.current_question = test.questions.first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_passed
    self.passed = passed? if completed?
  end

  def set_starting_time
    self.start_time = Time.current
  end
end
