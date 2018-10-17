require 'spec_helper'
describe 'locales' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with locales set to [\'en_US.UTF-8 UTF-8\', \'nl_NL.UTF-8 UTF-8\']' do
        let(:params) do
          {
            locales: ['en_US.UTF-8 UTF-8', 'nl_NL.UTF-8 UTF-8'],
          }
        end

        it { is_expected.to contain_file('locale genfile').with_content(%r{en_US.UTF-8 UTF-8\nnl_NL.UTF-8 UTF-8}) }
      end

      context 'with locale gen file path set to /opt/special' do
        let(:params) do
          {
            localegenfile:  '/opt/special',
          }
        end

        it { is_expected.to contain_file('locale genfile').with_path('/opt/special') }
      end

      context 'with locale default set to nl_NL.UTF-8' do
        let(:params) do
          {
            default_locale:  'nl_NL.UTF-8',
          }
        end

        it { is_expected.to contain_file('locale defaults').with_content(%r{LANG=nl_NL.UTF-8$}) }
      end
    end
  end
end
