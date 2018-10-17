require 'spec_helper'
describe 'locales' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with package_version set to 42.42.42' do
        let(:params) do
          {
            package_version: '42.42.42',
          }
        end

        it { is_expected.to contain_package('locales').with_ensure('42.42.42') }
      end

      context 'with package_name set to specialpackage' do
        let(:params) do
          {
            package_name: 'specialpackage',
          }
        end

        it { is_expected.to contain_package('locales').with_name('specialpackage') }
      end
    end
  end
end
