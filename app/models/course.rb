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
	has_many :pins

	def self.buscar(query)
    	return Course.where(["lower(course.name) LIKE ? or lower(course.initials) LIKE ?", "%" + query.downcase + "%", "%" + query.downcase + "%"]).limit(30)
  	end
end
