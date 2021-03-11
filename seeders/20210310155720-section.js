'use strict';
const Menu = require('../models').Menu;

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const menu = await Menu.findOne({ where: { merchantId: 1 } });
    if (menu.dataValues.id) {
      const sections = [
        {
          name: "Breakfast",
          serviceHours: JSON.stringify({
            mon: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "08:00",
                  endTime: "11:00"
                }
              ]
            },
            tue: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "08:00",
                  endTime: "11:00"
                }
              ]
            },
            wed: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "08:00",
                  endTime: "11:00"
                }
              ]
            },
            thu: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "08:00",
                  endTime: "11:00"
                }
              ]
            },
            fri: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "08:00",
                  endTime: "11:00"
                }
              ]
            },
            sat: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "08:00",
                  endTime: "11:00"
                }
              ]
            },
            sun: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "08:00",
                  endTime: "11:00"
                }
              ]
            }
          }),
          menuId: menu.dataValues.id
        },
        {
          name: "Lunch",
          serviceHours: JSON.stringify({
            mon: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "12:00",
                  endTime: "14:00"
                }
              ]
            },
            tue: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "12:00",
                  endTime: "14:00"
                }
              ]
            },
            wed: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "12:00",
                  endTime: "14:00"
                }
              ]
            },
            thu: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "12:00",
                  endTime: "14:00"
                }
              ]
            },
            fri: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "12:00",
                  endTime: "14:00"
                }
              ]
            },
            sat: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "12:00",
                  endTime: "14:00"
                }
              ]
            },
            sun: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "12:00",
                  endTime: "14:00"
                }
              ]
            }
          }),
          menuId: menu.dataValues.id
        },
        {
          name: "Regular",
          serviceHours: JSON.stringify({
            mon: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "15:00",
                  endTime: "22:00"
                }
              ]
            },
            tue: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "15:00",
                  endTime: "22:00"
                }
              ]
            },
            wed: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "15:00",
                  endTime: "22:00"
                }
              ]
            },
            thu: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "15:00",
                  endTime: "22:00"
                }
              ]
            },
            fri: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "15:00",
                  endTime: "22:00"
                }
              ]
            },
            sat: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "15:00",
                  endTime: "22:00"
                }
              ]
            },
            sun: {
              openPeriodType: "OpenPeriod",
              periods: [
                {
                  startTime: "15:00",
                  endTime: "22:00"
                }
              ]
            }
          }),
          menuId: menu.dataValues.id
        },
      ];

      queryInterface
        .bulkInsert('sections', sections)
        .then(() => console.log('Seed section data successfully.'))
        .catch((error) => console.log(`Seed section data failed. Error: ${error}`))
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
