Acts As Commentable (now with comment threads (TM)!!!  -- kidding on the (TM))
===================

Allows for threaded comments to be added to multiple and different models.  Drop-in compatible for acts_as_commentable (however requiring a database schema change)

Requirements
------------

This gem is for Rails 3 and later versions only.

This gem depends on [moretea's version](http://github.com/moretea/awesome_nested_set) of CollectiveIdea's Awesome Nested Set gem. It is installed if not already present when you install this gem.

You can find the gem on GitHub at [http://github.com/moretea/awesome_nested_set](http://github.com/moretea/awesome_nested_set).

Install
-------

In your Gemfile, add
    gem 'acts_as_commentable_with_threading'

and run `bundle install`.
	
Migrations
----------

* To install from scratch:

    `rails generate acts_as_commentable_with_threading_migration`

  This will generate the migration script necessary for the table
 	
* To upgrade to acts_as_commentable_with_threading from the old acts_as_commentable:

    `rails generate acts_as_commentable_upgrade_migration`

  This will generate the necessary migration to upgrade your comments table to work with acts_as_commentable_with_threading

If the generators fail, you can just as easily create the migrations by hand. See the templates in the generators under `lib/generators`.
	 	
Usage
-----
    class Article < ActiveRecord::Base
      acts_as_commentable
    end
 
* Add a comment to a model instance, for example an Article

      @article = Article.find(params[:id])
      @user_who_commented = @current_user
      @comment = Comment.build_from(@article, @user_who_commented.id, "Hey guys this is my comment!" )
	
* To make a newly created comment into a child/reply of another comment

      comment.move_to_child_of(the_desired_parent_comment)
	
* To retrieve all comments for an article, including child comments
	
      @all_comments = @article.comment_threads
	
* To retrieve only the root comments without their children comments
	
      @root_comments = @article.root_comments
	
* To check if a comment has children

      @comment.has_children?
	
* To verify the number of children a comment has
	
      @comment.children.size
	
* To retrieve a comments children

      @comment.children
	
	
*If you plan to use the acts_as_voteable plugin with your comment system be sure to uncomment two things:

in `lib/comment.rb` uncomment the line `acts_as_voteable`

in `lib/acts_as_commentable_with_threading.rb` uncomment the line `include Juixe::Acts::Voteable` near the top
	
Credits
-------
xxx - For contributing the updates for Rails 3!

Jack Dempsey  - This plugin/gem is heavily influenced/liberally borrowed/stole from acts_as_commentable

which in turn credits....

Xelipe - Because acts_as_commentable was heavily influenced by Acts As Taggable.

More
----

[http://tripledogdare.net](http://tripledogdare.net)

[http://evan.tiggerpalace.com](http://evan.tiggerpalace.com)
