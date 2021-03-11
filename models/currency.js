'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Currency extends Model {
    static associate(models) {

    }
  };
  Currency.init({
    code: DataTypes.STRING(10),
    exponent: { type: DataTypes.INTEGER },
    symbol: { type: DataTypes.STRING(5) }
  }, {
    sequelize,
    modelName: 'Currency',
    timestamps: true,
    tableName: 'currencies'
  });
  return Currency;
};