class ContactmailerMailer < ApplicationMailer
  default from:'Scotttillman23@gmail.com'
  def notify_scott(params)
    @name = params[:name]
    @phone = params[:phone]
    @message = params[:message]
    @email = params[:email]
    @subject = params[:subject]

    mail(
      to: 'Scotttillman23@gmail.com',
      subject: @subject
    )

  end
end
