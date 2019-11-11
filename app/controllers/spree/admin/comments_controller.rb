# frozen_string_literal: true

module Spree
  module Admin
    class CommentsController < Spree::Admin::ResourceController
      private

      def location_after_save
        request.referer
      end
    end
  end
end
