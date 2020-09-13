FactoryBot.define do
  factory :user do
    name { 'testuser' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    activated { true }
    activated_at { Date.today }

  trait :unconfirmed_user do
    name  { 'testuser2' }
    email { 'unconfirmed@user.com' }
    password { 'password' }
    activated { false }
    activated_at { nil }
  end

  end
end
