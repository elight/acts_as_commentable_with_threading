class ActsAsCommentableUpgradeMigration < ActiveRecord::Migration
  def self.up
    rename_column :comments, :comment, :body
    add_column    :comments, :subject, :string
    add_column    :comments, :parent_id, :integer
    add_column    :comments, :lft, :integer
    add_column    :comments, :rgt, :integer
    add_column    :comments, :updated_at, :datetime
    add_column    :comments, :commenter_id, :integer
    add_column    :comments, :commenter_type, :string
    remove_column :comments, :updated_at
    remove_column :comments, :user_id
    remove_column :comments, :user_type
    

    add_index     :comments, :commentable_id
    add_index     :comments, :commenter_id
    remove_index  :comments, :user_id
  end

  def self.down
    rename_column :comments, :body, :comment
    remove_column :comments, :subject
    remove_column :comments, :parent_id
    remove_column :comments, :lft
    remove_column :comments, :rgt
    remove_column :comments, :updated_at
    remove_column :comments, :commenter_id, :integer
    remove_column :comments, :commenter_type, :string
    
    add_column    :comments, :user_id, :integer
    add_column    :comments, :user_type, :string
    
    remove_index  :comments, :commenter_id
    remove_index  :comments, :commentable_id
   
    add_index     :comments, :user_id
  end
end
