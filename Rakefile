require "bundler/gem_tasks"
require "rake/testtask"
require "rspec/core/rake_task"

#Rake::TestTask.new(:test) do |t|
#  t.libs << "test"
#  t.libs << "lib"
#  t.test_files = FileList['test/**/*_test.rb']
#end

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format d']
end

task :default => :spec