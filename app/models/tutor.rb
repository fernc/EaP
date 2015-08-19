class Tutor < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :number,    :validate => /\d{3}-\d{3}-\d{4}/
	attribute :file, 			:attachment => true
	attribute :subjects,  :validate => true
	attribute :education, :validate => true
	attribute :availability, :validate => true
  attribute :message
	validates_length_of :message, minimum: 100
	attribute :terms
	validates_acceptance_of :terms, acceptance: true 
  attribute :nickname,  :captcha  => true

	# Declare the e-mail headers. It accepts anything the mail method
	# in ActionMailer accepts.

	def headers
    {
      :subject => "Easy As Pi Tutor Application",
      :to => "learningeasyaspi@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
