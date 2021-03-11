'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
      const modifierGroups = [
        {
          name: 'BurgerSize',
          availableStatus: 'AVAILABLE',
          selectionRangeMin: '1',
          selectionRangeMax: '1'
        },
        {
          name: 'BurgerExtra',
          availableStatus: 'AVAILABLE',
          selectionRangeMin: '0',
          selectionRangeMax: '4' 
        },
        {
          name: 'SoftDrink',
          availableStatus: 'AVAILABLE',
          selectionRangeMin: '0',
          selectionRangeMax: '1'
        }
      ];

      queryInterface
      .bulkInsert('modifier_groups', modifierGroups)
      .then(() => console.log('Seed modifier group data successfully.'))
      .catch((error) => console.log(`Seed modifier group data failed. Error: ${error}`))
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
