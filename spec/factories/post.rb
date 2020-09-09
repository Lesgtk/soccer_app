FactoryBot.define do
  factory :post do
    association :user
    content { '小学生のための動画です' }
    age_type { '小学生以下' }
    category { '技術' }
    id {'1'}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    title { '小学生の技術の付け方' }
    youtube_url { 'https://www.youtube.com/watch?v=yTAT-LK9Cds&t=5s' }
  end

end
