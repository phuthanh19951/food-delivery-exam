const express = require('express');
const router = express.Router();
const sectionRouter = require('./section');

router.use('/:menuId/sections', sectionRouter);

module.exports = router;
