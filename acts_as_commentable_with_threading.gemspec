ACTS_AS_COMMENTABLE_WITH_THREADING = Gem::Specification.new do |s|
  s.name     = "acts_as_commentable_with_threading"
  s.version  = "1.1.1"
  s.date     = "2011-12-08"
  s.summary  = "Polymorphic comments Rails gem - Rails 3+ only"
  s.email    = "evan@tripledogdare.net"
  s.homepage = "http://github.com/elight/acts_as_commentable_with_threading"
  s.description = "Polymorphic threaded comments Rails gem for Rails 3+"
  s.authors  = ["Evan Light", "Jack Dempsey", "Xelipe", "xxx"] 
  s.files    = `git ls-files`.split("\n")
  s.test_files = ["spec/commentable_spec.rb", "spec/comment_spec.rb", "spec/spec_helper.rb", "spec/db/database.yml", "spec/db/schema.rb"]

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 1.3'
  s.add_development_dependency 'sqlite3-ruby'
  s.add_development_dependency 'rails', '~> 3.0'

  s.add_dependency 'activerecord', '~> 3.0'
  s.add_dependency 'activesupport', '~> 3.0'
  s.add_dependency 'moretea-awesome_nested_set'
end
