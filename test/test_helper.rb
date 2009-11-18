$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), *%w[.. lib]))
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'fakefs/safe'
