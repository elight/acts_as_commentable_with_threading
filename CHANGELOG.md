v2.0.1
------

- Minor change to eliminate warning when used with Rails 5.x

v2.0.0
------

- Removed support for Rails 3.x - gem only supports Rails 4+ going forward.
- Updated rspec versions to 3.x and switch to 'expect' syntax.
- Removed default values from referencing id columns in `Comment` class.
- Added missing '.rb' suffix on migration files.

v1.2.0
------

- Updated rspec versions to 2.x and make corresponding changes to Rakefile.
- Removed sqlite3 development dependency to support JRuby in development/test.
- Added initial Rails 4 support, subject to acts_as_nested_set dependency.
- Removed empty string default values for string columns in `Comment`.

v1.1.3
------

- Fixed typos in acts_as_votable integration comment and instructions.
- Updated commentable to call `destroy_all` on `root_comments`, rather than on all comments (to ensure comments are properly deleted).
- Fixed polymorphic index to include `commentable_type`.
- Update Comment to use `validates` rather than the deprecated `validates_presence_of`.

v1.1.2
------

- Updated awesome_nested_set dependency to account for change in repository location.
- Fixed Comment so it stores the correct class when a commentable is an STL child class.
- Added commentable association to Comment.
- Assorted README changes.

v1.1.1
------

- Removed length limit on Commentable class name.
- Removed default order from `comment_threads`

v1.1.0
------

- Updated to Rails 3+.
- First Rubygems release.

v0.1.2
------

- Added new documentation in README that should better help users understand this plugin.
- Added new instance method `root_comments` that will return all comments belonging to a model except child comments.
- Added new class method for Comment: `self.build_from(object, user_id, comment_text:string)`. This method cleans up the code inside the controllers.
- Added new class method for Comment: `has_children?` that will return true or false depending on if a comment has children.
- Updated deprecated code in instance method `comments_ordered_by_submitted` - changed `self.type.name` to `self.class.name`.

v0.1.1
------

- Fixes to gemspec.

v0.1.0
------

- Initial Release.
