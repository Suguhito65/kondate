class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def previous
    Recipe.where("id > ?", self.id).order("id ASC").first
  end
  def next
    Recipe.where("id < ?", self.id).order("id DESC").first
  end
end
