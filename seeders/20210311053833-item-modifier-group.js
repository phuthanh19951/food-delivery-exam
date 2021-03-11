'use strict';

const ModifierGroup = require('../models').ModifierGroup;
const Item = require('../models').Item;

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const [item, modifierGroups] = await Promise.all([
      Item.findOne({ where: { name: 'Cheeseburger Deluxe' } }),
      ModifierGroup.findAll({})
    ]);

    if(item && Array.isArray(modifierGroups) && modifierGroups.length > 0){
      let itemModifierGroups = [];

      modifierGroups.forEach((modifierGroup) => {
        itemModifierGroups.push({ itemId: item.id, modifierGroupId: modifierGroup.id });
      });

      queryInterface
        .bulkInsert('item_modifierGroup', itemModifierGroups)
        .then(() => console.log('Seed Item Modifier data successfully.'))
        .catch((error) => console.log(`Seed Item Modifier data failed. Error: ${error}`))
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
