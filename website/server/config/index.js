const context = process.env.CONTEXT === `test` ? `cms` : process.env.CONTEXT;

let config;
try {
  config = require(`./${context}`);
} catch (err) {
  console.log(err);
  throw new Error(`Failed to load config file: ./${context}`);
}

module.exports = config;
