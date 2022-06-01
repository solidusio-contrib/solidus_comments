class ActsAsCommentableUpgradeMigration < SolidusSupport::Migration[4.2]
  def self.up
    rename_column :spree_comments, :comment, :body
    add_column :spree_comments, :subject, :string
    add_column :spree_comments, :parent_id, :integer
    add_column :spree_comments, :lft, :integer
    add_column :spree_comments, :rgt, :integer
  end

  def self.down
    rename_column :spree_comments, :body, :comment
    remove_column :spree_comments, :subject
    remove_column :spree_comments, :parent_id
    remove_column :spree_comments, :lft
    remove_column :spree_comments, :rgt
  end
end
