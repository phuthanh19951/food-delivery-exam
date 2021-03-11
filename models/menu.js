'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Menu extends Model {
    static associate(models) {
      // define association here
    }
  };
  Menu.init({
    name: DataTypes.STRING,
    currencyId: DataTypes.INTEGER,
    merchantId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Menu',
    timestamps: true,
    tableName: 'menus'
  });
  return Menu;
};