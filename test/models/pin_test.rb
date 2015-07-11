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

require 'test_helper'

class PinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
