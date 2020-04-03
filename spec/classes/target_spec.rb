require 'spec_helper'

describe 'ssh_sudoers::target' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:params) do
        { 'user'                 => 'bolt',
          'sudo_fragment_prefix' => '10_bolt',
          'ssh_public_key'       => 'foobar',
          'ssh_public_key_type'  => 'rsa' }
      end

      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
