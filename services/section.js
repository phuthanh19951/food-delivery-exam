const sectionRepository = require('../repositories/section');

const sectionService = {
  async getOneById(id){
    if(!id) throw new Error('Id not found');

    const section = await sectionRepository.getOneById(id);
    if(!section) throw new Error('Section not found');

    return section;
  }
};

module.exports = sectionService;