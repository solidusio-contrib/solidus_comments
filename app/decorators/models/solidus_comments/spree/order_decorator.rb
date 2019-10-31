module SolidusComments
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.class_eval do
          acts_as_commentable
        end
      end

      ::Spree::Order.prepend self
    end
  end
end
