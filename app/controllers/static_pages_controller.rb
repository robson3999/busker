# frozen_string_literal: true

class StaticPagesController < ApplicationController
  expose :songs, -> { Song.published.last(5).reverse }
end
