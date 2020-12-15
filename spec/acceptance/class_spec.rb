# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'with default parameters ', if: ['debian', 'ubuntu'].include?(os[:family]) do
  pp = <<-PUPPETCODE
  class { 'locales':
    default_locale => "en_GB.UTF-8",
    locales        => ["en_US.UTF-8 UTF-8", "en_GB.UTF-8 UTF-8"],
  }
PUPPETCODE

  it 'applies idempotently' do
    idempotent_apply(pp)
  end

  describe package('locales') do
    it { is_expected.to be_installed }
  end

  describe command('echo $LANG') do
    its(:stdout) { should match /en_GB.UTF-8/ }
  end
end
