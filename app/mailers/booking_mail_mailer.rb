class BookingMailMailer < ApplicationMailer
    def booking_mail(user)
      @booking = user
      mail to: user.email, subject: "SERV Booking Request"
    end

end
