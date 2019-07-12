# frozen_string_literal: true

json.extract! song, :id, :title, :text, :author_id, :created_at, :updated_at
json.url song_url(song, format: :json)
