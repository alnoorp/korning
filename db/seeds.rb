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
        employee.first_name = employee_data.first
        employee.email = employee_data.last
    end
end

CSV.foreach(datafile, headers: true) do |row|
    customer_data = row.to_hash['customer_and_account_no'].gsub('(',' ').gsub(')','').split(' ')
    Customer.find_or_create_by(name: customer_data.first) do |customer|
        customer.name = customer_data.first
        customer.account_number = customer_data.last
        customer.website = 'motorola.com' if customer.name == 'Motorola'
        customer.website = 'lg.com' if customer.name == 'LG'
        customer.website = 'htc.com' if customer.name == 'HTC'
        customer.website = 'nokia.com' if customer.name == 'Nokia'
        customer.website = 'apple.com' if customer.name == 'Apple'
        customer.website = 'samsung.com' if customer.name == 'Samsung'
    end
end

CSV.foreach(datafile, headers: true) do |row|
    Product.find_or_create_by(name: row['product_name']) do |product|
        product.name = row['product_name']
    end
end

CSV.foreach(datafile, headers: true) do |row|
    Invoice.find_or_create_by(number: row['invoice_no']) do |invoice|
        invoice.number = row['invoice_no']
    end
end

CSV.foreach(datafile, headers: true) do |row|
    Frequency.find_or_create_by(name: row['invoice_frequency']) do |frequency|
        frequency.name = row['invoice_frequency']
    end
end

CSV.foreach(datafile, headers: true) do |row|
    customer_data = row.to_hash['customer_and_account_no'].gsub('(',' ').gsub(')','').split(' ')
    employee_data = row.to_hash['employee'].gsub('(',' ').gsub(')','').split(' ')
    Transaction.find_or_create_by(id: row['id']) do |transaction|
        transaction.id = row['id']
        transaction.date = Chronic.parse(row['sale_date'])
        transaction.amount = row['sale_amount'].gsub('$','')
        transaction.quantity = row['units_sold']
        transaction.product_id = Product.where(name: row['product_name']).first.id
        transaction.customer_id = Customer.where(account_number: customer_data.last).first.id
        transaction.employee_id = Employee.where(last_name: employee_data[1]).first.id
        transaction.invoice_id = Invoice.where(number: row['invoice_no']).first.id
        transaction.frequency_id = Frequency.where(name: row['invoice_frequency']).first.id
    end
end

transactions = Transaction.all

transactions.each do |transaction|
    SaleInvoice.find_or_create_by(id: transaction.id) do |sale_invoice|
        sale_invoice.sale_id = transaction.id
        sale_invoice.invoice_id = transaction.invoice_id
    end
end














