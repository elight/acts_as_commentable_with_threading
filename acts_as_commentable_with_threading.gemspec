ACTS_AS_COMMENTABLE_WITH_THREADING = Gem::Specification.new do |s|
  s.name     = "acts_as_commentable_with_threading"
  s.version  = "0.1.0"
  s.date     = "2008-11-16"
  s.summary  = "Polymorphic comments Rails plugin"
  s.email    = "evan@tiggerpalace.com"
  s.homepage = "http://github.com/elight/acts_as_commentable_with_threading"
  s.description = "Polymorphic threaded comments Rails plugin/gem"
  s.has_rdoc = true
  s.authors  = ["Evan Light", "Jack Dempsey", "Xelipe"] 
  s.files    = [
    "CHANGELOG", 
		"MIT-LICENSE", 
		"README",
		"Rakefile", 
		"acts_as_commentable_with_threading.gemspec", 
                "init.rb",
                "install.rb",
		"lib/acts_as_commentable_with_threading.rb", 
		"lib/comment.rb"]
  s.test_files = ["spec/acts_as_commentable_test.rb"]
  s.rdoc_options = ["--main", "README"]

  s.add_dependency 'awesome_nested_set'
end
