
FactoryGirl.define do
  factory :banner_image, :class => Refinery::BannerImages::BannerImage do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

