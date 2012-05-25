
FactoryGirl.define do
  factory :sliding_image, :class => Refinery::SlidingImages::SlidingImage do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

