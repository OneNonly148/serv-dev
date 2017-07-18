class BookingMailMailer < ApplicationMailer
    def booking_mail(user)
      @booking = user
      mail to: user.email, subject: "SERV Booking Request"
      mail to: "serv.dev.p2@gmail.com", subject: "SERV Booking Request"
    end
end
