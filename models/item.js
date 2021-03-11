'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Item extends Model {
    static associate(models) {
      this.belongsTo(models.Category, {
        foreignKey: 'id'
      })
      this.belongsToMany(models.ModifierGroup, {
        through: 'ItemModifierGroup',
        foreignKey: 'itemId',
        as: 'modifierGroups'
      })
    }
  };
  Item.init({
    name: DataTypes.STRING,
    availableStatus: {
      type: DataTypes.ENUM('AVAILABLE', 'UNAVAILABLE')
    },
    description: {
      type: DataTypes.STRING(200)
    },
    price: {
      type: DataTypes.INTEGER
    },
    photos: {
      type: DataTypes.ARRAY(DataTypes.STRING)
    },
    specialType: {
      type: DataTypes.STRING(20)
    },
    categoryId: {
      type: DataTypes.INTEGER
    }
  }, {
    sequelize,
    modelName: 'Item',
    timestamps: true,
    tableName: 'items'
  });
  return Item;
};