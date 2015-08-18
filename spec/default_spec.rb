require 'chefspec'

# ChefSpec unit test for icaclient::default recipe
describe 'icaclient::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
  end

  before do
    stub_command('dpkg -l icaclient').and_return(1)
  end

  it 'installs packages' do
    expect(chef_run).to install_package('libxerces-c3.1')
    expect(chef_run).to install_package('libwebkitgtk-1.0-0')
  end

  it 'creates selfservice.desktop file' do
    expect(chef_run).to create_cookbook_file('/usr/share/applications/selfservice.desktop')
  end
end
