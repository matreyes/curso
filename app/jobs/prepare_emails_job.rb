class PrepareEmailsJob < Struct.new(:tutor_id, :all, :version, :subject, :message)
  def perform
    tutor = User.find(tutor_id)
    if all == 'true'
      User.participant.where(version: version).each do |user|
        AdminMailer.delay.send_email(tutor, user, subject, message)
      end
    elsif all == 'false'
      User.participant.where(version: version, tutor_id: tutor_id).each do |user|
        AdminMailer.delay.send_email(tutor, user, subject, message)
      end      
    end
  end
end