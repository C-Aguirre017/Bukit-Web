# == Schema Information
#
# Table name: applications
#
#  id          :integer          not null, primary key
#  pin_id      :integer
#  user_id     :integer
#  reached     :boolean
#  information :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Application < ActiveRecord::Base
  belongs_to :pin
  belongs_to :user

  before_save :default_values

  def default_values
  	self.reached = false
  end

end
