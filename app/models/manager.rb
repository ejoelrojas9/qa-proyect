class Manager < ApplicationRecord
  include PgSearch::Model

  def name
    "#{first_name} #{last_name}"
  end

  pg_search_scope :search_full_text, against: [
    [:first_name, 'A'],  # Field and priority
    [:age, 'B']
  ]
  
end