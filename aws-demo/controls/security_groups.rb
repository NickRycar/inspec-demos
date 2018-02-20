control "all-open-check" do
  impact 0.5
  title 'Check My all open security group.'

  describe aws_security_group(group_name: 'all-open') do
    it { should exist }
    its('vpc_id') { should cmp 'vpc-a966e6cc' }
  end
  
end

control "Validate SGs on VPC" do
  impact 0.7
  title 'Ensure expected security groups all exist.'

  describe aws_security_groups.where( vpc_id: 'vpc-a966e6cc') do
    its('group_ids') { should include('sg-1cea9178')}
    its('group_ids') { should include('sg-26eb0b42')}
    its('group_ids') { should include('sg-0f35f46b')}
  end

end
