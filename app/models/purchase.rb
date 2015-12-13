class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :outline

  def paypal_url(return_path)
    values = {
        business: "timothy.reen-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: 500,
        item_name: "This",
        item_number: 5,
        quantity: '1'
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
