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
    getAllCategorias = async () => {
        let returnArray = null;

        try {
            let pool = await sql.connect(config);
            let result = await pool.request().query("SELECT * FROM Categoria");
            returnArray = result.recordsets[0];
        }
        catch (error) {
            console.log(error)
        }
        return returnArray;
    }
    getAllAreas = async () => {
        let returnArray = null;

        try {
            let pool = await sql.connect(config);
            let result = await pool.request().query("SELECT * FROM Area");
            returnArray = result.recordsets[0];
        }
        catch (error) {
            console.log(error)
        }
        return returnArray;
    }
    getAllIdiomas = async () => {
        let returnArray = null;

        try {
            let pool = await sql.connect(config);
            let result = await pool.request().query("SELECT * FROM Idioma");
            returnArray = result.recordsets[0];
        }
        catch (error) {
            console.log(error)
        }
        return returnArray;
    }
    getByName = async (NombreDelCurso) => {
        let returnEntity = null;
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pNombreDelCurso', sql.VarChar, NombreDelCurso)
            .query('SELECT * FROM Cursos WHERE NombreDelCurso = @pNombreDelCurso');
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
    getByID = async (idCurso) => {
        let returnEntity = null;
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pidCurso', sql.Int ,idCurso)
            .query('SELECT * FROM Cursos WHERE idCurso = @pidCurso');
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
    insertCurso = async (Curso) => {
        let rowsAffected = 0;
        let newCurso = null;
        console.log("Curso", Curso)
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()            
            .query(`INSERT INTO Cursos (NombreDelCurso, ResumenCurso, PrecioDelCurso)
            VALUES ('${Curso.NombreDelCurso}', '${Curso.ResumenCurso}', '${Curso.precio}')`);
            rowsAffected = result.rowsAffected;
            newCurso = await this.getByName(Curso.NombreDelCurso);
        } catch (error) {
            console.log(error);
        }
        return newCurso;
    }
}
    
export default Cursos_Services;