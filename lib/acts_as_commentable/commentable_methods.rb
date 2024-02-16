require 'active_record'

# ActsAsCommentable
module Juixe
  module Acts
    module Commentable
      extend ActiveSupport::Concern

      class_methods do
        def acts_as_commentable(*args)
          options = args.to_a.flatten.compact.partition { |opt| opt.kind_of? Hash }

          join_options = options.first.blank? ? [{}] : options.first
          throw "Only one set of options can be supplied for the join" if join_options.length > 1
          join_options = join_options.first

          has_many :comments,
            **{ as: :commentable, dependent: :destroy }.merge(join_options)
        end
      end

      ActiveRecord::Base.include self
    end
  end
end
