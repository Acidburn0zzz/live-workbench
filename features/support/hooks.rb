Before('@new_project_dir') do
  @project_dir=Dir.mktmpdir 'live-workbench_project_'
end

After('@new_project_dir') do
  FileUtils.rm_rf @project_dir
end
