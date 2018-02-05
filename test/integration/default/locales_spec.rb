control 'locales 01' do
  impact 1.0
  title 'locales package is installed'
  desc 'Ensures that the locales package is installed on this system'
  describe package('locales') do
    it { is_expected.to be_installed }
  end
end

control 'locales 02' do
  impact 1.0
  title 'Locale is set correctly'
  desc 'Ensures that the provided locale is set on this system'
  describe command('echo $LANG') do
    its('stdout') { is_expected.to eq "zh_CN.UTF-8\n" }
  end
end
