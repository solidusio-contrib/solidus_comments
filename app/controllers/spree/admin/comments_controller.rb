# frozen_string_literal: true

module Spree
  module Admin
    class CommentsController < Spree::Admin::ResourceController
      private

      def render_after_create_error
        flash.keep
        redirect_to request.referer
      end

      def location_after_save
        request.referer
      end
    end
  end
end
