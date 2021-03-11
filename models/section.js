'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Section extends Model {
    static associate(models) {
      this.hasMany(models.Category, {
        foreignKey: 'sectionId',
        as: 'categories'
      })
    }
  };
  Section.init({
    name: DataTypes.STRING,
    serviceHours: DataTypes.JSON,
    menuId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Section',
    timestamps: true,
    tableName: 'sections'
  });
  return Section;
};