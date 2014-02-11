require "bundler/gem_tasks"

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList[
    'test/*_test.rb',
    'test/screens/*_test.rb',
    'test/factory/*_test.rb',
    'test/component/*_test.rb'
  ]
end

task :default => [:test]
