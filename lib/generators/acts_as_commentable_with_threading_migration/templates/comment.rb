class Comment < ActiveRecord::Base

  include ActsAsCommentableWithThreading::Comment

  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  acts_as_nested_set :scope => [:commentable_id, :commentable_type]
  attr_accessible :body

  validates_presence_of :body
  validates_presence_of :user

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_votable

  def has_children?
    self.children.any?
  end

end
