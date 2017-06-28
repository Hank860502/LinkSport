User.create!(
  first_name: "Hank",
    last_name: "Chen",
    username: "hc123",
    email: "hank@hank.com",
    password: "123123"
)

20.times do (
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    avatar: Faker::Avatar.image,
    password: "123123",
    itf:,
    utr:,
    ntr:,
    righthanded:,
    double_handed_backhand:,
    height:,
    weight:,
    sat:,
    toefl:,
    act:,
    birthday:,
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
