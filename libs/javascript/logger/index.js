const winston = require("winston");

const {combine, timestamp, printf} = winston.format;
const index = winston.createLogger({
  level: "info",
  format: combine(
    timestamp({
      format: "YYYY-MM-DD HH:mm:ss.SSS",
    }),
    printf((info) => `${info.timestamp} ${info.level.toUpperCase()}: ${info.message}`),
  ),
  transports: [],
});

if (process.env.NODE_ENV !== "production") {
  index.add(new winston.transports.Console({
    handleExceptions: true,
  }));
} else {
  index.add(
    new winston.transports.File({filename: "combined.log"}),
  );
  index.add(
    new winston.transports.File({filename: "error.log", level: "error"}),
  );
}

module.exports = index;
