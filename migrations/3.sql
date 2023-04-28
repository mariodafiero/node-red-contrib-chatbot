PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM admins;

DROP TABLE admins;

CREATE TABLE admins (
    id          INTEGER       PRIMARY KEY AUTOINCREMENT,
    username    VARCHAR (255),
    password    VARCHAR (255),
    first_name  VARCHAR (255),
    last_name   VARCHAR (255),
    mobilephone VARCHAR (255),
    avatar      VARCHAR (255),
    email       VARCHAR (255),
    payload     TEXT,
    permissions VARCHAR (255),
    chatbotId   TEXT,
    createdAt   DATETIME      NOT NULL,
    updatedAt   DATETIME      NOT NULL
);

INSERT INTO admins (
                       id,
                       username,
                       password,
                       first_name,
                       last_name,
                       avatar,
                       email,
                       payload,
                       permissions,
                       chatbotId,
                       createdAt,
                       updatedAt
                   )
                   SELECT id,
                          username,
                          password,
                          first_name,
                          last_name,
                          avatar,
                          email,
                          payload,
                          permissions,
                          chatbotId,
                          createdAt,
                          updatedAt
                     FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

CREATE INDEX admin_chatbotId ON admins (
    chatbotId
);

CREATE INDEX admin_password ON admins (
    password
);

CREATE INDEX admin_username ON admins (
    username
);

PRAGMA foreign_keys = 1;

