# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Music.album }
    description { Faker::TvShows::BojackHorseman.quote }
    user
  end
end
