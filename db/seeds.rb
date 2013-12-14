require 'csv'

datafile = Rails.root + 'db/data/sales.csv'

CSV.foreach(datafile, headers: true) do |row|
  Sale.find_or_create_by(invoice_no: row['invoice_no']) do |sale|
    sale.employee = row['employee']
    sale.customer_and_account_no = row['customer_and_account_no']
    sale.product_name = row['product_name']
    sale.sale_date = Chronic.parse(row['sale_date'])
    sale.sale_amount = row['sale_amount'].gsub('$','')
    sale.units_sold = row['units_sold']
    sale.invoice_no = row['invoice_no']
    sale.invoice_frequency = row['invoice_frequency']

    puts "Sale with invoice no. #{sale.invoice_no} processed"
  end
end

CSV.foreach(datafile, headers: true) do |row|
    employee_data = row.to_hash['employee'].gsub('(',' ').gsub(')','').split(' ')
    Employee.find_or_create_by(last_name: employee_data[1]) do |employee|
        employee.first_name = employee_data[0]
        employee.email = employee_data[2]
    end
end
