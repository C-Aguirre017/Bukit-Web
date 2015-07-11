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

class User < ActiveRecord::Base

  # Validation
  validates :name , presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  # References
  has_many :pins
  has_many :applications
  belongs_to :university
end
