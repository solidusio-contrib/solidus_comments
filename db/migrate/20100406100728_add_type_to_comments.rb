# frozen_string_literal: true

class AddTypeToComments < SolidusSupport::Migration[4.2]
  def self.up
    add_column :comments, :comment_type_id, :integer
  end

  def self.down
    remove_column :comments, :comment_type_id
  end
end
