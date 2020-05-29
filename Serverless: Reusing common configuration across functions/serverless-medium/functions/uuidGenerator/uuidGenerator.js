'use strict';
const uuid = require('uuid');
module.exports.handler = async event => {
  const generatedId = uuid.v4();
  return {
    statusCode: 200,
    body: generatedId
  };
};
