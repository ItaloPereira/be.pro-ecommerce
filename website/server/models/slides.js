const Model = require('../utils/model');

class Slides extends Model {
    constructor() {
        super('slides');
    }
}

module.exports = new Slides();