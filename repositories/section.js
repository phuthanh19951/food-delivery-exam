const Section = require('../models').Section;
const Category = require('../models').Category;
const Item = require('../models').Item;
const ModifierGroup = require('../models').ModifierGroup;
const Modifier = require('../models').Modifier;

const sectionRepository = {
  async getOneById(id) {
    let section = await Section.findByPk(id, {
      include: [
        {
          model: Category,
          as: 'categories',
          include: [{
            model: Item,
            as: 'items',
            include: [{
              model: ModifierGroup,
              as: 'modifierGroups',
              through: { attributes: [] },
              include: [{
                model: Modifier,
                as: 'modifiers'
              }]
            }]
          }]
        }
      ]
    });
    return section;
  }
};

module.exports = sectionRepository;