# frozen_string_literal: true

module SongsHelper
  def author_from_db(f_object)
    return '' if f_object.new_record?

    Author.find_by(id: f_object.author_id).name
  end
end
