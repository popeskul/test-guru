class Answer < ApplicationRecord
  ANSWERS_LIMIT = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validate :validate_answer_count, on: :create

  private

  def validate_answer_count
    errors.add(:question, 'Exceeded answers limit') if question.answers.count > ANSWERS_LIMIT
  end
end
