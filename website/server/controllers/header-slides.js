const SlidesModel = require(`../models/header-slides`);
const config = require(`../config`);
const Slides = {};

Slides.list = async () => {
    let slides = await SlidesModel.list();

    slides.map((slide, index) => {
        slides[index].bgr_image = `${config.url}/img/header-slides/${slide.bgr_image}`;
    });

    const data = slides;

    //modifies
    return data;
}

module.exports = Slides;