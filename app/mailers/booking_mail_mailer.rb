class BookingMailMailer < ApplicationMailer
    def booking_mail(user)
      @booking = user
      mail to: @booking.email, subject: "SERV Booking Request"
    end
    def admin_mail(user)
      @booking = user
      mail to: "serv.dev.p2@gmail.com", subject: "SERV Booking Request"
    end
end
