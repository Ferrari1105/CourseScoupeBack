import config from '../../dbconfig-env.js';
import sql from 'mssql'
class Usuario_Services{
    
getAll = async () => {
    let returnArray = null;
    console.log('Estoy en UsuarioServices.getAll()');
    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Usuario");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }
}

export default Usuario_Services;