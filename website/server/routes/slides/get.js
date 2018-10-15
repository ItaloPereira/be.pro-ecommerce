const SlidesController = require(`../../controllers/slides`);

module.exports = async (req, res) => {

    const slides = await SlidesController.list();

    res.status(200).send({ data: slides });
};