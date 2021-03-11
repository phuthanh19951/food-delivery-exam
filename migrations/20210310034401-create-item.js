'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('items', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING(60)
      },
      availableStatus: {
        type: Sequelize.ENUM('AVAILABLE', 'UNAVAILABLE')
      },
      description: {
        type: Sequelize.STRING(200)
      },
      price: {
        type: Sequelize.INTEGER
      },
      photos: {
        type: Sequelize.ARRAY(Sequelize.STRING)
      },
      specialType: {
        type: Sequelize.STRING(20)
      },
      categoryId: {
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal('NOW()')
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal('NOW()')
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('items');
  }
};