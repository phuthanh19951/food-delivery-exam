'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Category extends Model {
    static associate(models) {
      this.hasMany(models.Item, {
        foreignKey: 'categoryId',
        as: 'items'
      })
    }
  };
  Category.init({
    name: DataTypes.STRING(60),
    availableStatus: DataTypes.ENUM('AVAILABLE', 'UNAVAILABLE', 'HIDE'),
    sectionId: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Category',
    timestamps: true,
    tableName: 'categories'
  });
  return Category;
};