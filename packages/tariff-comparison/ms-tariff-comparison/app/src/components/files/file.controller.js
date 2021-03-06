const service = require("./file.service");
const logger = require("logger");

exports.listAllToProcess = async (req, res) => {
  return await service.listAllFilesToProcess()
    .then((value) => {
      logger.info(value);
      res.send(value);
    })
    .catch((reason) => {
      logger.error(reason.name);
      res.status(reason.statusCode || 500).send(reason);
    });
};

exports.deleteFilesById = async (req, res) => {
  return await service.deleteFilesById(req.body)
    .then((value) => {
      logger.info(value);
      res.send(value);
    })
    .catch((reason) => {
      logger.error(reason.name);
      res.status(reason.statusCode || 500).send(reason);
    });
};

exports.uploadFileToProcess = async (req, res) => {
  return await service.uploadFile(req.body)
    .then((value) => {
      logger.info(value);
      res.send(value);
    })
    .catch((reason) => {
      logger.error(reason.name);
      res.status(reason.statusCode || 500).send(reason);
    });
};

exports.startProcessing = async (req, res) => {
  return await service.processAllFiles()
    .then((value) => {
      logger.info(value);
      res.send(value);
    })
    .catch((reason) => {
      logger.error(reason.name);
      res.status(reason.statusCode || 500).send(reason);
    });
};
