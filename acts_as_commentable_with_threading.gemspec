Gem::Specification.new do |s|
  s.name     = 'acts_as_commentable_with_threading'
  s.version  = '1.2.0'
  s.date     = '2014-01-10'
  s.summary  = 'Polymorphic comments Rails gem - Rails 3+ only'
  s.email    = 'evan@tripledogdare.net'
  s.homepage = 'http://github.com/elight/acts_as_commentable_with_threading'
  s.description = 'Polymorphic threaded comments Rails gem for Rails 3+'
  s.authors  = ['Evan Light', 'Jack Dempsey', 'Xelipe', 'xxx']
  s.files    = `git ls-files`.split('\n')
  s.test_files = ['spec/commentable_spec.rb', 'spec/comment_spec.rb', 'spec/spec_helper.rb', 'spec/db/database.yml', 'spec/db/schema.rb']

  s.add_development_dependency 'rails', '>= 5.2'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.4'

  s.add_dependency 'activerecord', '>= 5.0'
  s.add_dependency 'activesupport', '>= 5.0'
  s.add_dependency 'awesome_nested_set', '3.2.0'
end
