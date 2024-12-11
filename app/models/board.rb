class Board < ApplicationRecord
  validates :name, presence: true
  validates :creator_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :height, :width, :number_of_mines, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :validates_number_of_mines

  private
    def validates_number_of_mines
      return if height.blank? || width.blank? || number_of_mines.blank?
      return if number_of_mines < height * width

      errors.add(:number_of_mines, "must be less than the total number of cells")
    end
end
