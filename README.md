Acts As Commentable (now with comment threads(TM)!!!  -- kidding on the (TM))
===================

Allows for threaded comments to be added to multiple and different models.
Drop-in compatible for acts_as_commentable (however requiring a database
schema change)

Requirements
------------
This gem is for Rails 3 and later versions only.

This gem depends on CollectiveIdea's Awesome Nested Set gem. It is installed if
not already present when you install this gem.

You can find the gem on GitHub at [collectiveidea/awesome_nested_set]

[collectiveidea/awesome_nested_set]: https://github.com/collectiveidea/awesome_nested_set

Install
-------
In your Gemfile, add:

    gem 'acts_as_commentable_with_threading'

and run `bundle install`.

Migrations
----------
* To install from scratch:

        rails generate acts_as_commentable_with_threading_migration

    This will generate the migration script necessary for the table

* To upgrade to acts_as_commentable_with_threading from the
  old acts_as_commentable:

        rails generate acts_as_commentable_upgrade_migration

    This will generate the necessary migration to upgrade your comments
    table to work with acts_as_commentable_with_threading

If the generators fail, you can just as easily create the migrations by hand.
See the templates in the generators under [`lib/generators`].

[`lib/generators`]: https://github.com/elight/acts_as_commentable_with_threading/tree/master/lib/generators

Usage
-----
    class Article < ActiveRecord::Base
      acts_as_commentable
    end

* Add a comment to a model instance, for example an Article:

        @article = Article.find(params[:id])
        @user_who_commented = @current_user
        @comment = Comment.build_from( @article, @user_who_commented.id, "Hey guys this is my comment!" )

* To make a newly created comment into a child/reply of another comment:

        comment.move_to_child_of(the_desired_parent_comment)

* To retrieve all comments for an article, including child comments:

        @all_comments = @article.comment_threads

* To retrieve only the root comments without their child comments:

        @root_comments = @article.root_comments

* To check if a comment has children:

        @comment.has_children?

* To verify the number of children a comment has:

        @comment.children.size

* To retrieve a comment's children:

        @comment.children

* If you plan to use the `acts_as_voteable` plugin with your comment system be
  sure to uncomment two things:

  * In `lib/comment.rb` uncomment the line [`acts_as_voteable`][L9].

  * In `lib/acts_as_commentable_with_threading.rb` uncomment the line
    [`include Juixe::Acts::Voteable`][L5] near the top.

[L9]: https://github.com/elight/acts_as_commentable_with_threading/blob/master/lib/generators/acts_as_commentable_with_threading_migration/templates/comment.rb#L9
[L5]: https://github.com/elight/acts_as_commentable_with_threading/blob/master/lib/acts_as_commentable_with_threading.rb#L5

Credits
-------
* [xxx](https://github.com/xxx) - For contributing the updates for Rails 3!
* [Jack Dempsey](https://github.com/jackdempsey) - This plugin/gem is heavily
  influenced/liberally borrowed/stolen from [acts_as_commentable].

And in turn...

* Xelipe - Because acts_as_commentable was heavily influenced by Acts As Taggable.

[acts_as_commentable]: https://github.com/jackdempsey/acts_as_commentable

More
----
* [http://tripledogdare.net](http://tripledogdare.net)
* [http://evan.tiggerpalace.com](http://evan.tiggerpalace.com)
