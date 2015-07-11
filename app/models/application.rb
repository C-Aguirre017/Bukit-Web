# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  pin_id     :integer
#  user_id    :integer
#  reached    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Application < ActiveRecord::Base
  belongs_to :pin
  belongs_to :user
end
