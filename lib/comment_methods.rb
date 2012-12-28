module ActsAsCommentableWithThreading
  # including this module into your Comment model will give you finders and named scopes
  # useful for working with Comments.
  # The named scopes are:
  #   in_order: Returns comments in the order they were created (created_at ASC).
  #   recent: Returns comments by how recently they were created (created_at DESC).
  #   limit(N): Return no more than N comments.
  module Comment

    def self.included(comment_model)
      comment_model.extend Finders
      comment_model.scope :in_order, -> { comment_model.order('created_at ASC') }
      comment_model.scope :recent, -> { comment_model.reorder('created_at DESC') }
    end

    def is_comment_type?(type)
      type.to_s == role.singularize.to_s
    end

    module Finders

      def find_comments_by_user(user, role = "comments")
        where(["user_id = ? and role = ?", user.id, role]).order("created_at DESC")
      end

      def find_comments_for_commentable(commentable_str, commentable_id, role = "comments")
        where(["commentable_type = ? and commentable_id = ? and role = ?", commentable_str, commentable_id, role]).order("created_at DESC")
      end

      def find_commentable(commentable_str, commentable_id)
        model = commentable_str.constantize
        model.respond_to?(:find_comments_for) ? model.find(commentable_id) : nil
      end
    end
  end
end
