class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  validates_presence_of :body
  validates_presence_of :user

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_votable

  belongs_to :commentable, :polymorphic => true

  # NOTE: Comments belong to a user
  belongs_to :user

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a user_id, and comment text
  # example in readme
  def self.build_from(obj, user_id, comment)
    new \
      :commentable => obj,
      :body        => comment,
      :user_id     => user_id
  end

  #helper method to check if a comment has children
  def has_children?
    self.children.any?
  end

  include ActsAsCommentableWithThreading::Comment

end
