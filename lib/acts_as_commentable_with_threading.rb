require 'active_record'
require 'awesome_nested_set'
ActiveRecord::Base.class_eval do
  include CollectiveIdea::Acts::NestedSet
  #include Juixe::Acts::Voteable   #<-- uncomment this if you have installed and wish to use the acts_as_voteable plugin
end

#
unless ActiveRecord::Base.respond_to?(:acts_as_nested_set)
  ActiveRecord::Base.send(:include, CollectiveIdea::Acts::NestedSet::Base) 
end

# ActsAsCommentableWithThreading
module Acts #:nodoc:
  module CommentableWithThreading #:nodoc:
  extend ActiveSupport::Concern

  module ClassMethods
    def acts_as_commentable
      has_many :comment_threads, :class_name => "Comment", :as => :commentable, :dependent => :destroy
      include Acts::CommentableWithThreading::LocalInstanceMethods
      extend Acts::CommentableWithThreading::SingletonMethods
    end
  end
    
  # This module contains class methods
  module SingletonMethods
    # Helper method to lookup for comments for a given object.
    # This method is equivalent to obj.comments.
    def find_comments_for(obj)
      Comment.where(:commentable_id => obj.id, :commentable_type => obj.class).order('created_at DESC')
    end
    
    # Helper class method to lookup comments for
    # the mixin commentable type written by a given user.  
    # This method is NOT equivalent to Comment.find_comments_for_user
    def find_comments_by_user(user)
      commentable = self.base_class.name.to_s
      Comment.where(:user_id => user.id, :commentable_type => commentable).order('created_at DESC')
    end
  end
  
  module LocalInstanceMethods
    
    # Helper method to display only root threads, no children/replies
    def root_comments
      self.comment_threads.where(:parent_id => nil)
    end
    
    # Helper method to sort comments by date
    def comments_ordered_by_submitted
      Comment.where(:commentable_id => id, :commentable_type => self.class.name).order('created_at DESC')
    end
    
    # Helper method that defaults the submitted time.
    def add_comment(comment)
      comments << comment
    end
  end
    
  end
end

ActiveRecord::Base.send(:include, Acts::CommentableWithThreading)
