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

require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
