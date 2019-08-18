CREATE USER rails WITH SUPERUSER encrypted password 'rails';
CREATE DATABASE activerecord_unittest;
CREATE DATABASE activerecord_unittest2;
GRANT all privileges ON database activerecord_unittest to rails;
GRANT all privileges ON database activerecord_unittest2 to rails;
