# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    # username { Faker::Games::Pokemon.name}
    username { Faker::Name.name }  
    email { Faker::Internet.email }
  end
end
