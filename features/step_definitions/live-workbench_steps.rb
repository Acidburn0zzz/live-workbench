Given /^I am in an empty directory where I want the project to be created$/ do
  # see Before hook for @new_project_dir
end

When /^I run live-workbench (.*)$/ do |opts|
  run_lw opts
end

Then /^the directory is populated with a standard project structure$/ do
  Dir['*','*/**'].sort.should == ["AUTHORS", "COPYING", "Makefile", "README", "TODO"]
end

Then /^I see \"([^"]+)\"$/ do |msg|
  @last_stdout.split("\n").should include msg
end

Given /^I am in the project top\-level directory$/ do
  with_lw {|lw| lw.init}
end

Given /^an image configuration exists$/ do
  with_lw {|lw| lw.auto}
end

Then /^an image build is started$/ do
  pending
  with_lw {|lw| lw.status.should == :building}
end

Then /^I see colorized output as it progresses$/ do
  pending
  with_lw {|lw| lw.log.should contain(COLOR_SEQ)}
end

Then /^auto scripts are created for a default configuration$/ do
  Dir['auto/**'].sort.should == ["auto/build", "auto/clean", "auto/config"]
end

