control "workstation-check" do
  impact 1.0
  title 'Check the bjc workstation'

  describe aws_ec2_instance(name: 'bjc-demo Workstation') do
    it { should exist }
    it { should be_running }
    its('image_id') { should eq 'ami-6bb13613' }
    its('tags') { should include(key: 'TTL', value: '8') }
  end
end
