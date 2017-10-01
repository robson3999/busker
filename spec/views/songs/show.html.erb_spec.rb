require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "Title",
      :text => "Text",
      :tag => "Tag",
      :chordbook => "Chordbook"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/Tag/)
    expect(rendered).to match(/Chordbook/)
  end
end
