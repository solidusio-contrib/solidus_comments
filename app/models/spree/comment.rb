# frozen_string_literal: true

module Spree
  class Comment < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    belongs_to :comment_type, optional: true

    default_scope { order('created_at ASC') }

    # NOTE: install the acts_as_votable plugin if you
    # want user to vote on the quality of comments.
    # acts_as_voteable

    # NOTE: Comments belong to a user
    belongs_to :user

    validates :comment, presence: true

    def self.included(comment_model)
      comment_model.extend Finders
      comment_model.scope :in_order, -> { comment_model.order('created_at ASC') }
      comment_model.scope :recent, -> { comment_model.reorder('created_at DESC') }
    end

    def is_comment_type?(type)
      type.to_s == role.singularize.to_s
    end

    module Finders
      # Helper class method to lookup all comments assigned
      # to all commentable types for a given user.
      def find_comments_by_user(user, role = "comments")
        where(["user_id = ? and role = ?", user.id, role]).order("created_at DESC")
      end

      # Helper class method to look up all comments for
      # commentable class name and commentable id.
      def find_comments_for_commentable(commentable_str, commentable_id, role = "comments")
        where(["commentable_type = ? and commentable_id = ? and role = ?", commentable_str, commentable_id, role]).order("created_at DESC")
      end

      # Helper class method to look up a commentable object
      # given the commentable class name and id
      def find_commentable(commentable_str, commentable_id)
        model = commentable_str.constantize
        model.respond_to?(:find_comments_for) ? model.find(commentable_id) : nil
      end
    end
  end
end
