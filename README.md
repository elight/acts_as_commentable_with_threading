Acts As Commentable with Threading
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

    gem 'acts_as_commentable_with_threading', git: 'git@github.com:codequest-eu/acts_as_commentable_with_threading.git'

and run `bundle install`.

Migrations
----------
* To install from scratch:

    rails generate acts_as_commentable_with_threading_migration

This will generate the migration script necessary for the table

Usage
-----
    class Car < ActiveRecord::Base
      acts_as_commentable :engine, :design
    end

* Add a comment to a model instance, for example an Car:

        @car = Car.find(params[:id])
        @comment = @car.engine_comment_threads.build(:body => "Hey guys this is my comment!", :user_id => current_user.id)

* To make a newly created comment into a child/reply of another comment:

        @comment.move_to_child_of(the_desired_parent_comment)

* To retrieve all comments for an article, including child comments:

        @all_comments = @car.engine_comment_threads

* To retrieve only the root comments without their child comments:

        @root_engine_comments = @car.root_engine_comments

* To check if a comment has children:

        @comment.has_children?

* To verify the number of children a comment has:

        @comment.children.size

* To retrieve a comment's children:

        @comment.children

* If you plan to use the `acts_as_votable` plugin with your comment system be
  sure to uncomment two things:

  * In `lib/comment.rb` uncomment the line [`acts_as_votable`][L9].

[L9]: https://github.com/elight/acts_as_commentable_with_threading/blob/master/lib/generators/acts_as_commentable_with_threading_migration/templates/comment.rb#L9

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
