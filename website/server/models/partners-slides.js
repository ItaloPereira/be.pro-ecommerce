const Model = require('../utils/model');

class Slides extends Model {
    constructor() {
        super('partners_slides');
    }
}

module.exports = new Slides();