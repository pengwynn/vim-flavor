Given 'a lockfile with:' do |content|
  steps %Q{
    Given a file named "#{'.'.to_lockfile_path}" with:
      """
      #{expand(content)}
      """
  }
end

Given 'I copy a new lockfile from another machine with:' do |content|
  steps %Q{
    Given a lockfile with:
      """
      #{content}
      """
  }
end

Given 'I delete the lockfile' do
  steps %Q{
    Given I remove the file "#{'.'.to_lockfile_path}"
  }
end

When 'I edit the lockfile as:' do |content|
  steps %Q{
    Given a lockfile with:
      """
      #{content}
      """
  }
end

Then /^(?:a|the) lockfile is (?:created|updated) with:$/ do |content|
  # For some reason, Cucumber drops the last newline from every docstring...
  steps %Q{
    Then the file "#{'.'.to_lockfile_path}" should contain exactly:
      """
      #{content == '' ? '' : expand(content) + "\n"}
      """
  }
end
