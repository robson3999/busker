# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    title { Faker::Music::Opera.donizetti }
    body { Faker::Lorem.paragraphs.join }
    author
    user
    published { true }
  end

  trait(:unpublished) do
    published { false }
  end
end
