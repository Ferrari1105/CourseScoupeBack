import config from "../dbconfig.js";
import sql from 'mssql'

// async function crearUsuario(usuario) {
//     await sql.connect(dbConfig);
//     const query = `INSERT INTO Usuario (Nombre, Contraseña, Email, TipoUsuario) 
//                    VALUES ('${usuario.NombreUsuario}', '${usuario.Contraseña}', '${usuario.Email}', '${usuario.TipoUsuario}')`;
//     await sql.query(query);
// }

// module.exports = {
//   crearUsuario,
// };

class Usuario_Services{
    
getAll = async () => {

    let returnArray = null;

    console.log('Estoy en: PERSONAJESERVIES.getAll()');

    try {

        let pool = await sql.connect(config);

        let result = await pool.request().query("SELECT * from Personajes");

        returnArray = result.recordsets[0];

    }

    catch (error) {

        console.log(error);

    }

    return returnArray;

}
}
