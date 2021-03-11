'use strict';

const ModifierGroup = require('../models').ModifierGroup;

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const modifierGroups = await ModifierGroup.findAll();

    if (Array.isArray(modifierGroups) && modifierGroups.length > 0) {
      let modifiers = [];

      const burgerSizeModifiers = [
        {
          name: 'S',
          availableStatus: 'AVAILABLE',
          price: 0
        },
        {
          name: 'M',
          availableStatus: 'AVAILABLE',
          price: 2,
        },
        {
          name: 'L',
          availableStatus: 'AVAILABLE',
          price: 3,
        }
      ];

      const burgerExtraModifiers = [
        {
          name: 'Cheese',
          availableStatus: 'AVAILABLE',
          price: 1
        },
        {
          name: 'Beef',
          availableStatus: 'AVAILABLE',
          price: 2,
        },
        {
          name: 'Salad',
          availableStatus: 'AVAILABLE',
          price: 1,
        }
      ];

      const softDrinkModifiers = [
        {
          name: 'Pepsi',
          availableStatus: 'AVAILABLE',
          price: 1
        },
        {
          name: 'Cocacola',
          availableStatus: 'AVAILABLE',
          price: 2,
        },
        {
          name: '7up',
          availableStatus: 'AVAILABLE',
          price: 3,
        }
      ];

      modifierGroups.forEach((modifierGroup) => {
        const modifierGroupId = modifierGroup.dataValues.id;

        if (modifierGroup.name === 'BurgerSize') {
          burgerSizeModifiers.forEach((burgerSize) => {
            modifiers.push({ ...burgerSize, modifierGroupId });
          })
        } else if (modifierGroup.name === 'BurgerExtra') {
          burgerExtraModifiers.forEach((burgerExtra) => {
            modifiers.push({ ...burgerExtra, modifierGroupId });
          })
        } else if (modifierGroup.name === 'SoftDrink') {
          softDrinkModifiers.forEach((softDrink) => {
            modifiers.push({ ...softDrink, modifierGroupId });
          })
        }
      });

      queryInterface
        .bulkInsert('modifiers', modifiers)
        .then(() => console.log('Seed modifier data successfully.'))
        .catch((error) => console.log(`Seed modifier data failed. Error: ${error}`))
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
