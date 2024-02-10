create table organizations (
    id bigint auto_increment primary key,
    name varchar(255) not null,
    representative_name varchar(255) not null,
    phone varchar(20),
    postal_code varchar(10),
    address text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    unique(name)
);

create table users (
    id bigint auto_increment primary key,
    organization_id bigint,
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (organization_id) references organizations(id),
    unique(email)
);

create table counterparties (
    id bigint auto_increment primary key,
    organization_id bigint,
    name varchar(255) not null,
    representative_name varchar(255) not null,
    phone varchar(20),
    postal_code varchar(10),
    address text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (organization_id) references organizations(id)
);

create table counterparty_bank_accounts (
    id bigint auto_increment primary key,
    counterparty_id bigint,
    bank_name varchar(255) not null,
    branch_name varchar(255),
    account_number varchar(50) not null,
    account_holder_name varchar(255) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (counterparty_id) references counterparties(id)
);

create table invoices (
    id bigint auto_increment primary key,
    organization_id bigint,
    counterparty_id bigint,
    issue_date date not null,
    payment_amount decimal(15, 2) not null,
    fee decimal(15, 2) not null,
    fee_rate decimal(5, 2) not null,
    tax decimal(15, 2) not null,
    tax_rate decimal(5, 2) not null,
    total_amount decimal(15, 2) not null,
    payment_due_date date not null,
    status int not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (organization_id) references organizations(id),
    foreign key (counterparty_id) references counterparties(id)
);
