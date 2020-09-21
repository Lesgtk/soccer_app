require 'csv'

# 　テストユーザー
User.create!(name: 'ゲストユーザー',
             email: 'test@example.com',
             password: '123456',
             password_confirmation: '123456',
             image: open("#{Rails.root}/db/fixtures/image/image-1.png"),
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

# 管理ユーザー作成
User.create!(name: 'kame',
             email: 'kame@example.com',
             password: '123456',
             password_confirmation: '123456',
             image: open("#{Rails.root}/db/fixtures/image/image-2.png"),
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# ユーザー
User.create!(name: 'サッカー少年',
             email: 'test1@example.com',
             password: '123456',
             password_confirmation: '123456',
             image: open("#{Rails.root}/db/fixtures/image/image-3.png"),
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '黄倉ケンタ',
             email: 'test2@example.com',
             password: '123456',
             password_confirmation: '123456',
             image: open("#{Rails.root}/db/fixtures/image/image-4.png"),
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '林太郎',
             email: 'test3@example.com',
             password: '123456',
             password_confirmation: '123456',
             image: open("#{Rails.root}/db/fixtures/image/image-5.png"),
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '山田かずま',
             email: 'test4@example.com',
             password: '123456',
             password_confirmation: '123456',
             image: open("#{Rails.root}/db/fixtures/image/image-6.png"),
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '高畑里見',
             email: 'test5@example.com',
             password: '123456',
             password_confirmation: '123456',
             image: open("#{Rails.root}/db/fixtures/image/image-7.png"),
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

1.upto(49) do |i|
  name  = Faker::Name.name
  email = "sample-#{i}@example.com"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: false,
               activated: true,
               activated_at: Time.zone.now)
end

CSV.foreach('db/CSV/user-表1.csv', headers: true) do |row|
  User.create!(
    name: row['name'],
    email: row['email'],
    password: row['password'],
    password_confirmation: row['password_confirmation'],
    admin: row['admin'],
    activated: row['activated'],
    activated_at: row['activated_at']
  )
end

CSV.foreach('db/CSV/post-表1.csv', headers: true) do |row|
  Post.create!(
    user_id: row['user_id'],
    title: row['title'],
    content: row['content'],
    age_type: row['age_type'],
    category: row['category'],
    youtube_url: row['youtube_url'],
    created_at: row['created_at']
  )
end

CSV.foreach('db/CSV/comment-表1.csv', headers: true) do |row|
  Comment.create!(
    user_id: row['user_id'],
    post_id: row['post_id'],
    created_at: row['created_at'],
    comment_content: row['comment_content']
  )
end

CSV.foreach('db/CSV/likes-表1.csv', headers: true) do |row|
  Like.create!(
    user_id: row['user_id'],
    post_id: row['post_id']
  )
end

CSV.foreach('db/CSV/relationships-表1.csv', headers: true) do |row|
  Relationship.create!(
    follower_id: row['follower_id'],
    followed_id: row['followed_id']
  )
end
