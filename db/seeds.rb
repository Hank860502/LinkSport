User.create!(
  first_name: "漢宇",
  last_name: "陳",
  username: "hc123",
  email: "hank@hank.com",
  password: "123123",
  itf: 315,
  utr: 11,
  ntr: 30,
  height: 180,
  weight: 78,
  sat: 1780,
  toefl: 97,
  birthday: "1997/05/02",
  about: "我是陳漢宇",
  first_name_en: "Han-Yu",
  last_name_en: "Chen",
  gpa: 4,
  academy: "Hope Tennis Academy",
  country: "Taiwan",
  city: "台中",
  skype: "hank860502"
)

20.times do (
  User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  first_name_en: Faker::Name.first_name,
  last_name_en: Faker::Name.last_name,
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: "123123",
  about: Faker::Hipster.sentence
  # avatar: Faker::Avatar.image,
  # itf:,
  # utr:,
  # ntr:,
  # righthanded:,
  # double_handed_backhand:,
  # height:,
  # weight:,
  # sat:,
  # toefl:,
  # act:,
  # birthday:,
    )
  )
end

100.times do (
  Following.create!(
    follower_id: rand(1..20),
    # causes problem, user can follow himself or follow others several times.
    followee_id: rand(1..20)
    )
  )
end

36.times do (
  Tweet.create!(
    body: Faker::Hipster.sentence,
    user_id: rand(1..20)
    )
  )
end

1000.times do (
  Like.create!(
    tweet_id: rand(1..100)
    )
  )
end
