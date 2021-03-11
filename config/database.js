require('dotenv').config();

const DATABASE_CONFIG = {
  HOST: process.env.DATABASE_HOST,
  USERNAME: process.env.DATABASE_USERNAME,
  PASSWORD: process.env.DATABASE_PASSWORD,
  NAME: process.env.DATABASE_NAME,
  PORT: process.env.DATABASE_PORT,
  DIALECT: process.env.DATABASE_DIALECT
};

module.exports = DATABASE_CONFIG;