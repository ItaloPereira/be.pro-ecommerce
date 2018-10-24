const SlidesController = require(`../../controllers/header-slides`);

module.exports = async (req, res) => {

    const slides = await SlidesController.list();

    res.status(200).send({ data: slides });
};