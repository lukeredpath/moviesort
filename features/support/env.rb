require 'test/unit/assertions'
require 'fakefs/safe'

World(Test::Unit::Assertions)

Before do
  FakeFS.activate!
end

After do
  FakeFS::FileSystem.clear
  FakeFS.deactivate!
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), *%w[.. .. lib]))
