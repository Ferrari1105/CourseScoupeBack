import config from '../../dbconfig-env.js';
import sql from 'mssql'
class Cursos_Services{
    
getAllCursos = async () => {
    let returnArray = null;

    try {
        let pool = await sql.connect(config);
       let result = await pool.request().query("SELECT * FROM Cursos");
       returnArray = result.recordsets[0];
    }
    catch (error){
        console.log(error)
    }
    return returnArray;
    }
   
}
    
export default Cursos_Services;