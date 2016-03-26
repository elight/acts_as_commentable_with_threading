class Comment < ActiveRecord::Base
  acts_as_nested_set scope: [:commentable_id, :commentable_type]

  validates :body, presence: true
  validates :commenter, presence: true

  # NOTE: install the acts_as_votable plugin if you
  # want commenter to vote on the quality of comments.
  #acts_as_votable

  belongs_to :commentable, polymorphic: true

  # NOTE: Comments belong to a commenter
  belongs_to :commenter, :polymorphic => true

  # Helper class method that allows you to build a comment
  # by passing a commentable object, a commenter object, and comment text
  # example in readme
  def self.build_from(obj, commenter, comment)
    new \
      commentable:  obj,
      body:         comment,
      commenter:    commenter
  end

  # helper method to check if a comment has children
  def has_children?
    !self.children.empty?
  end

  # Helper class method to lookup all comments assigned
  # to all commentable types for a given commenter.
  scope :find_comments_by_commenter, lambda { |commenter|
    where(commenter_id: commenter.id, commenter_type: commenter.class.to_s).order('created_at DESC')
  }

  # Helper class method to look up all comments for
  # commentable class name and commentable id.
  scope :find_comments_for_commentable, lambda { |type, id|
    where(commentable_type: type.to_s,
          commentable_id: id).order('created_at DESC')
  }

  # Helper class method to look up a commentable object
  # given the commentable class name and id
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end
end
