const sectionService = require('../../services/section');

const sectionController = {
  async getOneById(req, res) {
    try {
      const { id } = req.params;
      const section = await sectionService.getOneById(id);
      res.status(200).json({
        data: section
      });
    } catch (err) {
      res.status(500).json({
        message: err.message
      });
    }
  }
};

module.exports = sectionController;