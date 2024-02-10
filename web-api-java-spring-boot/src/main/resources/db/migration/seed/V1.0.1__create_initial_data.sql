-- insert into organizations
insert into organizations (id, name, representative_name, phone, postal_code, address)
values
    (1, 'Acme Corporation', 'John Doe', '123-456-7890', '100-0001', '123 Acme Way');

-- insert into users
insert into users (id, organization_id, name, email, password)
values
    (1, 1, 'Jane Doe', 'jane.doe@acme.com', 'hashedpassword123');

-- insert into counterparties
insert into counterparties (id, organization_id, name, representative_name, phone, postal_code, address)
values
    (1, 1, 'Beta Company', 'Alice Bob', '098-765-4321', '200-0002', '456 Beta Street');

-- insert into counterparty_bank_accounts
insert into counterparty_bank_accounts (id, counterparty_id, bank_name, branch_name, account_number, account_holder_name)
values
    (1, 1, 'Bank of Beta', 'Downtown', '987654321', 'Beta Company');

-- insert into invoices
insert into invoices (id, organization_id, counterparty_id, issue_date, payment_amount, fee, fee_rate, tax, tax_rate, total_amount, payment_due_date, status)
values
    (1, 1, 1, '2023-01-01', 10000.00, 400.00, 4.00, 44.00, 10.00, 10440.00, '2023-01-31', 1);
