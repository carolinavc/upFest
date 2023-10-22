const mysql = require('mysql');
const env = process.env
// Pool doesn't need con.end()
const con = mysql.createPool({
  connectionLimit: 5,
  host: env.DB_HOST,
  user: env.DB_USER,
  password: env.DB_PASS,
  database: env.DB_NAME
});
// con.connect()
function queryDB(sql, values) {
  return new Promise((resolve, reject) => {
    con.query(sql, values, function (err, results) {
      if (err) {
        reject(err);
      } else {
        resolve(results);
      }
    });
  });
}

module.exports = {queryDB, con};