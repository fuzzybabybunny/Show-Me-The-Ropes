# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rooky, :class => 'Rookie' do
    rookie_id "MyString"
    experience "MyString"
  end
end
