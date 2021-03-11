'use strict';
const Currency = require('../models').Currency;

module.exports = {
  up: async (queryInterface, Sequelize) => {
   const currency = await Currency.findOne({ where: { code: 'USD' } });
   if(currency.dataValues.id){
      return queryInterface.bulkInsert('menus', [{
        merchantId: 1,
        name: 'Menu 1',
        currencyId: currency.dataValues.id
      }])
      .then(() => console.log('Seed menu data successfully.'))
      .catch((error) => console.log(`Seed menu data failed. Error: ${error}`))
   }
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
  }
};
