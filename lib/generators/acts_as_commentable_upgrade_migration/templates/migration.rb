class ActsAsCommentableUpgradeMigration < ActiveRecord::Migration
  def self.up
    rename_column :comments, :comment, :body
    add_column :comments, :subject, :string
    add_column :comments, :parent_id, :integer
    add_column :comments, :lft, :integer
    add_column :comments, :rgt, :integer
    add_column :comments, :updated_at, :datetime
    add_column :comments, :no_reply_required, :boolean, :default => false
    add_column :comments, :awaiting_reply, :boolean, :default => false
    add_column :comments, :hidden, :boolean, :default => false
    add_column :comments, :admin_post, :boolean, :default => false

    add_index :comments, :commentable_id
  end
  
  def self.down
    rename_column :comments, :body, :comment
    remove_column :comments, :subject
    remove_column :comments, :parent_id
    remove_column :comments, :lft
    remove_column :comments, :rgt
    remove_column :comments, :updated_at
    remove_column :comments, :no_reply_required
    remove_column :comments, :awaiting_reply
    remove_column :comments, :hidden
    
    remove_index :comments, :commentable_id
  end
end
