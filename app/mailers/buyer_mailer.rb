class BuyerMailer < ApplicationMailer
	def buyer_email(seller,buyer,seller_email,buyer_email,property)
    @buyer=buyer
    @seller=seller
    @property=property

    @url  = 'http://example.com/login'
    mail(to: buyer_email, subject: 'conform to buy property')
  end
  def seller_email(seller,buyer,seller_email,buyer_email,property)
 
    @buyer=buyer
    @seller=seller
    @property=property

    @url  = 'http://example.com/login'
    mail(to: seller_email, subject: 'Intersted buyer')
  end

end
