require 'spec_helper'
describe 'locales' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with defaults for all parameters' do
        it { is_expected.to contain_class('locales') }
        it { is_expected.to contain_anchor('locales::begin').that_comes_before('Class[locales::Install]') }
        it { is_expected.to contain_class('locales::install').that_comes_before('Class[locales::Config]') }
        it { is_expected.to contain_class('locales::config').that_comes_before('Anchor[locales::end]') }
        it { is_expected.to contain_anchor('locales::end') }
        it { is_expected.to contain_exec('generate locales').that_subscribes_to('File[locale genfile]').that_subscribes_to('File[locale defaults]') }
        it { is_expected.to contain_exec('update locale').that_subscribes_to('File[locale genfile]').that_subscribes_to('File[locale defaults]') }
      end
    end
  end
end
