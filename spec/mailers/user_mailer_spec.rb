require 'rails_helper'


RSpec.describe UserMailer, type: :mailer do
  describe "#success_email" do
   let(:user) { create(:user, username: 'Hello') }
   let(:mail) { UserMailer.with(user: user).success_email}

   it 'renders the header' do
    expect(mail.subject).to eq('Welcome to Odin Book!')
    expect(mail.to).to eq([user.email])
    expect(mail.from).to eq(['registrations@odinbook.com'])
   end


   it 'renders the body' do
    expect(mail.body).to include(user.username)
   end
  end
end