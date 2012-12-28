class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]

  attr_accessible :body, :commentable, :user_id

  validates_presence_of :body
  validates_presence_of :user

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_votable

  belongs_to :commentable, :polymorphic => true

  belongs_to :user

  def has_children?
    self.children.any?
  end

  include ActsAsCommentableWithThreading::Comment

end
