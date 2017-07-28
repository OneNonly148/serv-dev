class BookingMailMailer < ApplicationMailer
    def booking_mail(user, service)
      @booking = user
      $pack = service
      @package = Package.all
      @car_make = Make.all
      @car_model = Model.all
      @l_region = Mjloc.all
      @l_location = Mnloc.all
      mail to: @booking.email, cc: "serv.dev.p2@gmail.com", subject: "SERV Booking Request"
    end
end
