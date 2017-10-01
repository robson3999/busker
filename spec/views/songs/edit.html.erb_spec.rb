require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "MyString",
      :text => "MyString",
      :tag => "MyString",
      :chordbook => "MyString"
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input[name=?]", "song[title]"

      assert_select "input[name=?]", "song[text]"

      assert_select "input[name=?]", "song[tag]"

      assert_select "input[name=?]", "song[chordbook]"
    end
  end
end
