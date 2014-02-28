require 'spec_helper'

describe 'flapjack' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "flapjack class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('flapjack::params') }

        it { should contain_class('flapjack::install') }
        it { should contain_class('flapjack::config') }
        it { should contain_class('flapjack::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'flapjack class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
