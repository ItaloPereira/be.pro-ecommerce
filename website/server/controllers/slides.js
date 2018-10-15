const SlidesModel = require(`../models/slides`);
const config = require(`../config`);
const Slides = {};

Slides.list = async () => {
    let slides = await SlidesModel.list();

    slides.map((slide, index) => {
        slides[index].bgrImage = `${config.url}/img/slides/${slide.bgrImage}`;
    });

    const data = slides;

    //modifies
    return data;
}

module.exports = Slides;