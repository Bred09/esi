import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();
const pe = process.env;

const pool = mysql
  .createPool({
    host: pe.MYSQL_HOST,
    user: pe.MYSQL_USER,
    password: pe.MYSQL_PASSWORD,
    database: pe.MYSQL_DATABASE,
  })
  .promise();

//   Custom query
export async function sqlQuery(sql, params) {
  const rows = await pool.query(sql, params);
  return rows;
}

// Users {{{111
//   Set sms code
export async function setSmsCode(smsCode, phone) {
  const [rows] = await pool.query("UPDATE simsim.users SET sms_code = ? WHERE phone = ?;", [smsCode, phone]);
  return rows;
}