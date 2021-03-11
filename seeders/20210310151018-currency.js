'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const currencies = [
      {
        code: "SGD",
        exponent: 2,
        symbol: "S$"
      },
      {
        code: "USD",
        exponent: 2,
        symbol: "$"
      },
      {
        code: "VND",
        exponent: 0,
        symbol: "đ"
      }
    ];

    await queryInterface
      .bulkInsert('currencies', currencies)
      .then(() => { 
        console.log('Seed currency data successfully.');
        return;
      })
      .catch((error) => { 
        console.log(`Seed currency data failed. error: ${error}`);
        return;
      })
  },

  down: async (queryInterface, Sequelize) => {
    queryInterface.bulkDelete('currencies', {});
  }
};
