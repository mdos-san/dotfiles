module.exports = function(results, context) {
  results.filter(r => r.messages.length > 0)
    .map(r => JSON.stringify({
      filename: r.filePath,
      lnum: r.messages[0].line,
      col: r.messages[0].column,
      text: r.messages[0].message,
    }))
    .map(line => console.log(line));
};
