'use strict';
const Category = require('../models').Category;

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const categories = await Category.findAll();

    if(Array.isArray(categories) && categories.length > 0){
      let items = [];

      const promotionItems = [{
        name: 'Combo 2A',
        availableStatus: 'AVAILABLE',
        description: 'Combo',
        price: 7
      },
      {
        name: 'Combo 3B',
        availableStatus: 'AVAILABLE',
        description: 'Combo',
        price: 8
      }];

      const chickenItems = [{
        name: '3pcs Fried Chickens',
        availableStatus: 'AVAILABLE',
        description: 'Chicken',
        price: 5
      },
      {
        name: '2pcs Fried Chicken Meal',
        availableStatus: 'AVAILABLE',
        description: 'Chicken',
        price: 4
      }];

      const burgerItems = [{
        name: 'Cheeseburger Deluxe',
        availableStatus: 'AVAILABLE',
        description: 'Burger',
        price: 2
      },
      {
        name: 'Double Cheeseburger',
        availableStatus: 'AVAILABLE',
        description: 'Burger',
        price: 3
      }];

      categories.forEach((category) => {
        const categoryId = category.dataValues.id;

        if(category.name === 'Promotion'){
          promotionItems.forEach((promoItem) => {
            items.push({ ...promoItem, categoryId });
          })
        }else if(category.name === 'Chicken'){
          chickenItems.forEach((chickenItem) => {
            items.push({ ...chickenItem, categoryId });
          })
        }else if(category.name === 'Burgers'){
          burgerItems.forEach((burgerItem) => {
            items.push({ ...burgerItem, categoryId });
          })
        }
      });
  
      queryInterface
      .bulkInsert('items', items)
      .then(() => console.log('Seed item data successfully.'))
      .catch((error) => console.log(`Seed item data failed. Error: ${error}`))
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
