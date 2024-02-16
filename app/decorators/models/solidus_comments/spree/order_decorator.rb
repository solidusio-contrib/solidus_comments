# frozen_string_literal: true

module SolidusComments
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.acts_as_commentable
      end

      ::Spree::Order.prepend self
    end
  end
end
