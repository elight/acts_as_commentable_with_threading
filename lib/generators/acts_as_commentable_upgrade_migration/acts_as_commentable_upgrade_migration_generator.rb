class ActsAsCommentableUpgradeMigrationGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  source_root File.expand_path('../templates', __FILE__)
  
  # *for the life of me*, i can't figure out why this isn't implemented elsewhere.
  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def manifest
    migration_template 'migration.rb', 'db/migrate/acts_as_commentable_upgrade_migration.rb'
    copy_file 'comment.rb', 'app/models/comment.rb'
  end
end
