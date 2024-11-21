class Board < ApplicationRecord
  validates :name, presence: true
  validates :creator_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :rows_count, :columns_count, :mines_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
