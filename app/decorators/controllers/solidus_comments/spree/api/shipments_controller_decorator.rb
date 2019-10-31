module SolidusComments
  module Spree
    module Api
      module ShipmentsControllerDecorator
        def comments
          shipment
          @comment_types = ::Spree::CommentType.where(:applies_to => "Shipment")
        end

        ::Spree::Api::ShipmentsController.prepend self
      end
    end
  end
end
