const Model = require('../utils/model');

class Slides extends Model {
    constructor() {
        super('header_slides');
    }
}

module.exports = new Slides();