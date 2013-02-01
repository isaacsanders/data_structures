require "bundler/gem_tasks"

task :test do
  tests = FileList["test/**/*_test.rb"]
  tests.each do |test|
    ruby "-I lib -I test -r test_helper #{test}"
  end
end
