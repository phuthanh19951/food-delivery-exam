'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ItemModifierGroup extends Model {
    static associate(models) {
      // define association here
    }
  };
  ItemModifierGroup.init({
    itemId: DataTypes.INTEGER,
    modifierGroupId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'ItemModifierGroup',
    timestamps: true,
    tableName: 'item_modifierGroup'
  });
  return ItemModifierGroup;
};