'use strict';
const Section = require('../models').Section;

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const section = await Section.findOne({ where: { name: 'Regular' } });
    if(section.dataValues.id){
      const sectionId = section.dataValues.id;

      const categories = [
        {
          name: 'Burgers',
          availableStatus: 'AVAILABLE',
          sectionId
        },
        {
          name: 'Promotion',
          availableStatus: 'AVAILABLE',
          sectionId
        },
        {
          name: 'Chicken',
          availableStatus: 'AVAILABLE',
          sectionId
        }
      ];

      queryInterface
      .bulkInsert('categories', categories)
      .then(() => console.log('Seed category data successfully.'))
      .catch((error) => console.log(`Seed category data failed. Error: ${error}`))
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
