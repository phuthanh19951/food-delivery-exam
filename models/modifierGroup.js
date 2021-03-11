'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class ModifierGroup extends Model {
    static associate(models) {
      this.belongsToMany(models.Item, {
        through: 'ItemModifierGroup',
        foreignKey: 'modifierGroupId',
        as: 'items'
      });
      this.hasMany(models.Modifier, {
        foreignKey: 'modifierGroupId',
        as: 'modifiers'
      });
    }
  };
  ModifierGroup.init({
    name: DataTypes.STRING,
    availableStatus: DataTypes.ENUM('AVAILABLE', 'UNAVAILABLE'),
    selectionRangeMin: DataTypes.INTEGER,
    selectionRangeMax: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'ModifierGroup',
    timestamps: true,
    tableName: 'modifier_groups'
  });
  return ModifierGroup;
};