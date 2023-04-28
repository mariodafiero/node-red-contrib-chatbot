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
PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM users;

DROP TABLE users;

CREATE TABLE users (
    id          INTEGER       PRIMARY KEY AUTOINCREMENT,
    userId      VARCHAR (255) NOT NULL
                              UNIQUE,
    email       VARCHAR (255),
    first_name  VARCHAR (255),
    last_name   VARCHAR (255),
    mobilephone VARCHAR (255),
    username    VARCHAR (255),
    language    VARCHAR (255),
    payload     TEXT,
    chatbotId   TEXT,
    createdAt   DATETIME      NOT NULL,
    updatedAt   DATETIME      NOT NULL
);

INSERT INTO users (
                      id,
                      userId,
                      email,
                      first_name,
                      last_name,
                      username,
                      language,
                      payload,
                      chatbotId,
                      createdAt,
                      updatedAt
                  )
                  SELECT id,
                         userId,
                         email,
                         first_name,
                         last_name,
                         username,
                         language,
                         payload,
                         chatbotId,
                         createdAt,
                         updatedAt
                    FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

CREATE INDEX user_chatbotId ON users (
    chatbotId
);

CREATE INDEX user_email ON users (
    email
);

CREATE INDEX user_language ON users (
    language
);

CREATE INDEX user_userid ON users (
    userId
);

CREATE INDEX user_username ON users (
    username
);

PRAGMA foreign_keys = 1;

