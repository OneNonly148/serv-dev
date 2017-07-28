class BookingMailMailer < ApplicationMailer
    def booking_mail(email)

      mail to: email.email, cc: "serv.dev.p2@gmail.com", subject: "SERV Booking Request"
    end
end
