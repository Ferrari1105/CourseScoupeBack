import config from '../../dbconfig-env.js';
import sql from 'mssql'
class Usuario_Services{
    
getAllUsuarios = async () => {
    let returnArray = null;

    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Usuario ");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }
    getByName = async (nombre) => {
        let returnEntity = null;

        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pNombre', sql.VarChar, nombre)
            .query('SELECT * FROM Usuario WHERE NombreUsuario = @pNombre');
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
    
    insertUsuario = async (Usuario) => {
        let rowsAffected = 0;
        let newUser = null;

        try {
            let pool = await sql.connect(config);
            let result = await pool.request()            
            .query(`INSERT INTO Usuario (NombreUsuario, Contraseña, Email)
            VALUES ('${Usuario.nombre}', '${Usuario.contraseña}', '${Usuario.mail}')`);
            rowsAffected = result.rowsAffected;
            newUser = await this.getByName(Usuario.NombreUsuario);
        } catch (error) {
            console.log(error);
        }
        return newUser;
    }
}
    
export default Usuario_Services;