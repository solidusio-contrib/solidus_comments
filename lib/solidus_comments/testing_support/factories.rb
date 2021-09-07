# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: Spree::Comment do
    association :commentable, factory: :order
    user
    sequence(:comment) { |n| "Comment #{n}" }
  end
end
