class BookingMailMailer < ApplicationMailer
    def booking_mail(name, email, phone, servicen, maken, modeln, date, regionn, locationn, transfer, cash, promo)
      @name = name
      @email = email
      @phone = phone
      @service = servicen
      @make = maken
      @model = modeln
      @date = date
      @region = regionn
      @location = locationn
      @transfer = transfer
      @cash = cash
      @promo = promo
      mail to: @email, cc: "serv.dev.p2@gmail.com", subject: "SERV Booking Request"
    end
end
