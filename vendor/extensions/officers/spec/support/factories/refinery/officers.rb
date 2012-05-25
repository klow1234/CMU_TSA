
FactoryGirl.define do
  factory :officer, :class => Refinery::Officers::Officer do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

