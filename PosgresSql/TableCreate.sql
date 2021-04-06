CREATE TABLE CATEGORIES(
    id      UUID DEFAULT uuid_generate_v4(),
    name    VARCHAR NOT NULL,
    images  VARCHAR,
    create_At DATE,
    update_At DATE,
    PRIMARY KEY(id)
);

CREATE TABLE SUPPLIERS(
    id      UUID DEFAULT uuid_generate_v4(),
    name    VARCHAR     NOT NULL,
    email   VARCHAR,
    phone   VARCHAR,
    address TEXT        NOT NULL,
    PRIMARY KEY(id) 
);

-- Product Table
CREATE TABLE PRODUCTS (
    id      UUID DEFAULT uuid_generate_v4(),
    brand   VARCHAR NOT NULL,
    model   VARCHAR NOT NULL,
    price   INT     NOT NULL, -- Harga Jual
    cost    INT     NOT NULL, -- Harga Beli
    stock   INT     NOT NULL,
    unit    VARCHAR NOT NULL,
    images  VARCHAR NOT NULL,
    description TEXT,
    categoryId  UUID REFERENCES CATEGORIES(id),
    supplierId  UUID REFERENCES SUPPLIERS(id),
    create_At DATE,
    update_At DATE,
    PRIMARY KEY(id)
);

CREATE PRODUCT_CATEGORY(
    id  INT PRIMARY KEY,
    productId   UUID REFERENCES PRODUCTS(id),
    categoryId  UUID REFERENCES CATEGORIES(id)
);

CREATE TABLE ROLES(
    id      INT         NOT NULL,
    name    VARCHAR     NOT NULL,
    description VARCHAR NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE PERMISSION(
    id      INT     NOT NULL,
    name    VARCHAR NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE ROLE_PERMISSION(
    roleID  INT REFERENCES ROLES(id) ON UPDATE CASCADE ON DELETE CASCADE,
    permissionId    INT REFERENCES PERMISSION(id) ON DELETE CASCADE,
    CONSTRAINT PK_ROLE_PERMISSION PRIMARY KEY(roleID, permissionId)
);

CREATE TABLE STORE(
    id      INT         NOT NULL,
    name    VARCHAR     NOT NULL,
    email   VARCHAR     NOT NULL,
    phone   VARCHAR     NOT NULL,
    address VARCHAR     NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE USERS(
    id      UUID DEFAULT uuid_generate_v4(),
    name        VARCHAR NOT NULL,
    username    VARCHAR UNIQUE NOT NULL,
    email       VARCHAR NOT NULL,
    password    VARCHAR NOT NULL,
    roleID      INT REFERENCES ROLES(id),
    avatar      VARCHAR,
    status      enum,
    create_At    date,
    update_At    date,
    PRIMARY KEY(id)
);
