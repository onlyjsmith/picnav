require "ap"
require "nokogiri"
require "sinatra"
require "rubygems"
require "open-uri"
require "fileutils"
require "yaml"

require "./picnav.rb"
require "./pages.rb"

Pages.new.start
