class CarAnswer < ApplicationRecord
  belongs_to :car_inspection
  belongs_to :question
  #before_save :set_weighted

  # def weighted
  #   case self.question.question_type
  #     when "range"
  #       self.answer *
  #     when "yes_or_no"
  #
  #     when "yes_no_na"
  #
  #     when "good_bad"
  #
  #     when "good_bad_na"
  #
  #     end
  # end
  
  # def set_weighted
  #   case self.question.question_type
  #   when "range"
  #     self.answer *
  #   when "yes_or_no"
  #
  #   when "yes_no_na"
  #
  #   when "good_bad"
  #
  #   when "good_bad_na"
  #
  #   end
  # end
end
