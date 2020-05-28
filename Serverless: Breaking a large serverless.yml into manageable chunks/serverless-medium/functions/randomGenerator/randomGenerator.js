'use strict';
const Chance = require('chance');

module.exports.handler = async event => {
  const chance = new Chance();
  return {
    statusCode: 200,
    body: chance.string()
  };
};
