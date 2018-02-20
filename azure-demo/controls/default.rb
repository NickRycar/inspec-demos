control 'azure-vm-test' do
  impact 1.0
  title 'Checks VM settings'
  desc 'Ensures proper settings on ARM VM.'

  describe azure_virtual_machine(name: 'rycar-test', resource_group: 'RycarAzureNode') do
    its('os_type') { should eq 'Windows' }
    its('has_public_ipaddress?') { should eq true }
    its('computername') {should eq 'rycar-test'}
  end
end
