# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  initials   :string
#  branch     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ActiveRecord::Base
	
    validates :initials, uniqueness: true
    validates :name, presence: true

	has_many :pins

	def self.buscar(query)
    	return Course.where(["lower(name) LIKE ? or lower(initials) LIKE ?", "%" + query.downcase + "%", "%" + query.downcase + "%"]).limit(10)
  	end
end
