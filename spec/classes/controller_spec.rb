require 'spec_helper'

describe 'ssh_sudoers::controller' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:params) do
        { 'user'                    => 'root',
          'ssh_private_key_content' => 'foobar' }
      end

      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
