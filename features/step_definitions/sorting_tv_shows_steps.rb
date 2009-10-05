require 'moviesort/command_line'

### givens
  
Given /^a folder "([^\"]*)" containing the file "([^\"]*)"$/ do |parent, file|
  FileUtils.mkdir_p(parent)
  FileUtils.touch(File.join(parent, file))
end

Given /^a folder "([^\"]*)" containing the folder "([^\"]*)"$/ do |parent, folder|
  FileUtils.mkdir_p(File.join(parent, folder))
end

## whens

When /^I run Moviesort with the options "([^\"]*)"$/ do |options|
  Moviesort::CommandLine.parse(options).run
end

## thens

Then /^the movie should be moved to "([^\"]*)"$/ do |path|
  assert File.exist?(path)
end

Then /^the folder "([^\"]*)" should exist$/ do |dir|
  assert File.directory?(dir)
end
