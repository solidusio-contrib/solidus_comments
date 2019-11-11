# frozen_string_literal: true

module SolidusComments
  module Spree
    module ShipmentDecorator
      def self.prepended(base)
        base.class_eval do
          acts_as_commentable
        end
      end

      ::Spree::Shipment.prepend self
    end
  end
end
