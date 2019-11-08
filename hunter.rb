require 'emailhunter'
require 'dotenv'
require 'pry'

Dotenv.load

class Hunter
  def initialize
    @email_hunter = EmailHunter.new(ENV["API_KEY"])
  end

  def verify(email:)
    @email_hunter.verify(email)
  end

  def emails_for(domain:)
    search(domain: domain).to_h[:data][:emails].map { |contact| contact[:value] }
  end

  private
  
  def search(domain:)
    @email_hunter.search(domain)
  end
end

hunter = Hunter.new
puts hunter.emails_for(domain: 'shopify.com')