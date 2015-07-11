# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  profession    :string
#  email         :string
#  role          :integer
#  phone         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  university_id :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
