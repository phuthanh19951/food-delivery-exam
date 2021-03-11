const express = require('express');
const router = express.Router({ mergeParams: true });
const sectionApi = require('../api/v1/section');

router.get('/:id', sectionApi.getOneById);

module.exports = router;
