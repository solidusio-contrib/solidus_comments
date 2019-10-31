module SolidusComments
  module Spree
    module Admin
      module OrdersControllerDecorator
        def comments
          load_order
          @comment_types = ::Spree::CommentType.where(:applies_to => "Order")
        end

        ::Spree::Admin::OrdersController.prepend self
      end
    end
  end
end
