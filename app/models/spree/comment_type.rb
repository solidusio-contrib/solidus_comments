# frozen_string_literal: true

module Spree
  class CommentType < ApplicationRecord
    has_many :comments
  end
end
