class School < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :state
  validates_presence_of :group

  def info
    if group == 'k-12'
      "K-12: #{name}, #{state}."
    elsif group == 'college'
      "College: #{name}, #{state}."
    elsif group == 'other'
      "Other: #{name}, #{state}."
    end
  end

  def self.by_name
    order(:name)
  end

end
