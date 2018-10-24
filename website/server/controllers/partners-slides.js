const SlidesModel = require(`../models/partners-slides`);
const config = require(`../config`);
const Slides = {};

Slides.list = async () => {
    let slides = await SlidesModel.list();

    slides.map((slide, index) => {
        slides[index].partner_image = `${config.url}/img/partners-slides/${slide.partner_image}`;
    });

    const data = slides;

    //modifies
    return data;
}

module.exports = Slides;