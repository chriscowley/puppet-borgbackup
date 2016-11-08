require 'spec_helper'

describe 'borgbackup' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "borgbackup class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { should contain_class('borgbackup::params')}
          it { should contain_class('borgbackup::install')}
          it { should contain_class('borgbackup::createrepo')}
        end
      end
    end
  end
  context 'unsupported operating system' do
    describe 'borgbackup class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end
      it { expect { is_expected.to contain_package('borgbackup')}.to raise_error(Puppet::Error, /Nexenta not supported/)}
    end
  end
end
