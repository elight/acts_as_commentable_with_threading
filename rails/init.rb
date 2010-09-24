# encoding: utf-8
require 'acts_as_commentable_with_threading'

# Why isn't this being done in the railtie require?
ActiveRecord::Base.send(:include, CollectiveIdea::Acts::NestedSet::Base)

