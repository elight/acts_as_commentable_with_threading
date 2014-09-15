require 'active_record'

require 'logger'

plugin_test_dir = File.dirname(__FILE__)

ActiveRecord::Base.logger = Logger.new(File.join(plugin_test_dir, "debug.log"))

ActiveRecord::Base.configurations = YAML::load_file(File.join(plugin_test_dir, "db", "database.yml"))
ActiveRecord::Base.establish_connection((ENV["DB"] || "sqlite3mem").to_sym)
ActiveRecord::Migration.verbose = false
load(File.join(plugin_test_dir, "db", "schema.rb"))

require File.join(plugin_test_dir, '..', 'init')
require File.join(plugin_test_dir, '..', 'lib', 'generators', 'acts_as_commentable_with_threading_migration', 'templates', 'comment')

class User < ActiveRecord::Base
  has_many :comments
end

class Commentable < ActiveRecord::Base
  acts_as_commentable
end

ActiveRecord::Base.send(:include, Acts::CommentableWithThreading)
