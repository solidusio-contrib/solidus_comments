# frozen_string_literal: true

module Spree
  class CommentType < ApplicationRecord
    ORDER = "Order"

    has_many :comments
  end
end
