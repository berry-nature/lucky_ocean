const path = require('path');

var config = {
  module: {
    loaders: [{
      test: /\.js$/,
      exclude: /node_modules/,
      loader: "babel-loader",
      query: {
        presets: ["es2015"]
      }
    }]
  },
};

var application = Object.assign({}, config, {
  name: 'application',
  entry: "./web/static/js/app.js",
  output: {
    path: path.resolve(__dirname, "priv/static/js"),
    filename: "app.js"
  },
});

module.exports = [
  application,
];
