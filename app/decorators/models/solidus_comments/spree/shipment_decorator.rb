# frozen_string_literal: true

module SolidusComments
  module Spree
    module ShipmentDecorator
      # FIXME:
      # Shipments can have comments, but there is no admin interface to add new
      # shipment comments or view existing ones.
      #
      def self.prepended(base)
        base.acts_as_commentable
      end

      ::Spree::Shipment.prepend self
    end
  end
end
