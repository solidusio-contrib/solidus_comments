# frozen_string_literal: true

module SolidusComments
  module Spree
    module Admin
      module OrdersControllerDecorator
        def comments
          load_order

          @comment_types =
            ::Spree::CommentType.where applies_to: ::Spree::CommentType::ORDER
        end

        ::Spree::Admin::OrdersController.prepend self
      end
    end
  end
end
