# == Schema Information
#
# Table name: pins
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  publication :datetime
#  realization :datetime
#  duration    :integer
#  title       :string
#  description :string
#  price       :integer
#  help_type   :integer
#  faculty     :string
#  latitude    :float
#  longitude   :float
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pin < ActiveRecord::Base

  has_many :applications

  belongs_to :user
  belongs_to :course

   # Validation
  validates :course, presence: true
  validates :user, presence: true
  validates :latitude, numericality: { less_than_or_equal_to: 90, greater_than_or_equal_to: -90 }
  validates :longitude, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180 }


  def self.search(title)
      return Pin.where(["lower(title) LIKE ?", "%" + title.downcase + "%"]).limit(25)      
  end

  def self.conditions(condiciones)
    [conditions_clauses(condiciones).join(' AND '), *conditions_options(condiciones)]
  end

  def self.conditions_clauses(condiciones)
    condiciones.map { |condition| condition.first }
  end

  def self.conditions_options(condiciones)
    condiciones.map { |condition| condition[1..-1] }.flatten
  end

  def cantSolicitudes
    return applications.all.count
  end

end
