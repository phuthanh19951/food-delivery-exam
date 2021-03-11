'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Modifier extends Model {
    static associate(models) {
      this.belongsTo(models.ModifierGroup, {
        foreignKey: 'id'
      })
    }
  };
  Modifier.init({
    name: DataTypes.STRING(40),
    availableStatus: DataTypes.ENUM('AVAILABLE', 'UNAVAILABLE'),
    price: DataTypes.INTEGER,
    modifierGroupId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Modifier',
    timestamps: true,
    tableName: 'modifiers'
  });
  return Modifier;
};