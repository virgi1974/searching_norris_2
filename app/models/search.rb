class Search < ApplicationRecord
  serialize :data, Hash

  scope :with_text, ->(text) { where("text = ?", text) }
  scope :created_randomly, -> { where("text = ? AND category = ?", "", "") }

  def self.with_category(category)
    self.select do |search|
      search.data["categories"].include?(category)
    end
  end
end
