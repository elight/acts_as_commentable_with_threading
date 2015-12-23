Gem::Specification.new do |s|
  s.name     = "acts_as_commentable_with_threading"
  s.version  = "2.0.1"
  s.date     = "2015-12-22"
  s.summary  = "Polymorphic comments Rails gem - Rails 4+ only"
  s.email    = "evan@tripledogdare.net"
  s.homepage = "http://github.com/elight/acts_as_commentable_with_threading"
  s.description = "Polymorphic threaded comments Rails gem for Rails 4+"
  s.authors  = ["Evan Light", "Jack Dempsey", "Xelipe", "xxx"]
  s.files    = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '>= 3.0'
  s.add_development_dependency 'rails', '>= 4.0'

  s.add_dependency 'activerecord', '>= 4.0'
  s.add_dependency 'activesupport', '>= 4.0'
  s.add_dependency 'awesome_nested_set', '>= 3.0'
end
