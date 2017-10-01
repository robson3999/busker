json.extract! song, :id, :title, :text, :tag, :chordbook, :created_at, :updated_at
json.url song_url(song, format: :json)
