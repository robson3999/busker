# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'songs/new', type: :view do
  before(:each) do
    assign(:song, Song.new(
                    title: 'MyString',
                    text: 'MyString',
                    tag: 'MyString',
                    chordbook: 'MyString'
                  ))
  end

  it 'renders new song form' do
    render

    assert_select 'form[action=?][method=?]', songs_path, 'post' do
      assert_select 'input[name=?]', 'song[title]'

      assert_select 'input[name=?]', 'song[text]'

      assert_select 'input[name=?]', 'song[tag]'

      assert_select 'input[name=?]', 'song[chordbook]'
    end
  end
end
