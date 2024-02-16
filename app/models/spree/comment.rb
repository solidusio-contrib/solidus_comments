# frozen_string_literal: true

module Spree
  class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    belongs_to :comment_type, optional: true
    belongs_to :user

    default_scope { order "created_at ASC" }

    scope :recent, -> { reorder "created_at DESC" }

    validates :comment, presence: true
  end
end
