import config from '../../dbconfig-env.js';
import sql from 'mssql'
class Usuario_Services{
    
getAllUsuarios = async () => {
    let returnArray = null;
    console.log('Estoy en UsuarioServices.getAll()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Usuario WHERE ");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }
    getByName = async (nombre) => {
        let returnEntity = null;
        console.log('Estoy en: GetByName');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pNombre', sql.Text, nombre)
            .query('SELECT * FROM Usuario WHERE NombreUsuario = @pNombre');
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
    
    insertUsuario = async (Usuario) => {
        let rowsAffected = 0;
        console.log('Estoy en: insertUsuario');
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .query(`INSERT INTO Usuario (NombreUsuario, Contraseña, Email, TipoUsuario)
            VALUES ('${Usuario.NombreUsuario}', '${Usuario.Contraseña}', '${Usuario.Email}', '${Usuario.TipoUsuario}')`);
            rowsAffected = result.rowsAffected;
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }
}
    
export default Usuario_Services;