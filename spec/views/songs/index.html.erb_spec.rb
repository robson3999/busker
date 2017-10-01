require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :title => "Title",
        :text => "Text",
        :tag => "Tag",
        :chordbook => "Chordbook"
      ),
      Song.create!(
        :title => "Title",
        :text => "Text",
        :tag => "Tag",
        :chordbook => "Chordbook"
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
    assert_select "tr>td", :text => "Chordbook".to_s, :count => 2
  end
end
