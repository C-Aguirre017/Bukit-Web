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


 def self.buscar(latitud, longitud, rango, ramo, tipo_ayuda, limit = 30, realizado = false)
    condiciones = []
    if not ramo.nil?
      ramo = Ramo.find(ramo)
      if not ramo.nil?
        condiciones.push(["pins.ramo_id = ?", ramo.id])
      end
    end
    if not tipo_ayuda.nil?
      condiciones.push(["pins.tipo_ayuda = ?", tipo_ayuda])
    end
    if not latitud.nil? or not longitud.nil?
      if limit.nil?
        limit = 20
      end
      if rango.nil?
        rango = 30
      end
      return Pin.where(conditions(condiciones)).within(rango, :origin => [latitud, longitud]).limit(limit).sort_by{|s| s.distance_to( [latitud, longitud])}
    else
      return Pin.where(conditions(condiciones))
    end
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


end
