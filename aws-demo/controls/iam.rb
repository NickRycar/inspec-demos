control "user-check" do
  impact 0.5
  title 'Check My IAM user'

  describe aws_iam_user(name: 'nrycar') do
    it { should exist }
    it { should have_mfa_enabled }
  end
end

