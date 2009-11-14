require 'jeweler'

Jeweler::Tasks.new do |gemspec|
  gemspec.name = "moviesort"
  gemspec.summary = "Small command-line utility for sorting downloaded TV shows and movies"
  gemspec.email = "luke@lukeredpath.co.uk"
  gemspec.authors = ["Luke Redpath"]
  gemspec.executables << 'moviesort'
end

Jeweler::GemcutterTasks.new

task :push_tiny  => ['version:bump:patch', 'gemcutter:release']
task :push_minor => ['version:bump:minor', 'gemcutter:release']
task :push_major => ['version:bump:major', 'gemcutter:release']
