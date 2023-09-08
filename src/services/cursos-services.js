import config from '../../dbconfig-env.js';
import sql from 'mssql'

class Cursos_Services{
    getCursosProcesados = async (curso) => {
        let cursoDelFont = await this.getByID(curso);
        const cursoNoId = {
            Adelanto:"",
            HechoConIa:"",
            NivelCurso:"",
            NombreDelCurso:"",
            NumeroEstudiantes:"",
            PortadaCurso:"",
            PrecioDelCurso:"",
            ResumenCurso:"",
            Valoracion:"",
            Areas:"",
            Categorias:"",
            Creador:"",
            Estilo:"",
            Idioma:"",
            ImagenCursos:"",
            cantLecciones:""
          };
        try {
            cursoNoId.Adelanto = cursoDelFont.Adelanto;
         //   cursoNoId.HechoConIa = cursoDelFont.HechoConIa;
            cursoNoId.NombreDelCurso = cursoDelFont.NombreDelCurso;
            cursoNoId.PortadaCurso = cursoDelFont.PortadaCurso;
            cursoNoId.PrecioDelCurso = cursoDelFont.PrecioDelCurso;
            cursoNoId.ResumenCurso = cursoDelFont.ResumenCurso;
            //cursoNoId.NivelCurso = curso.NivelCurso;
            //cursoNoId.NumeroEstudiantes = curso.NumeroEstudiantes;
            //cursoNoId.Valoracion = curso.Valoracion;
            //cursoNoId.ImagenCursos = curso.ImagenCursos;
            //cursoNoId.cantLecciones = curso.cantLecciones;
            //cursoNoId.Creador = curso.Creador;
            let pool = await sql.connect(config);
            let estilo = await pool.request().query(`SELECT TOP 1 NombreEstilo FROM Estilo E JOIN Cursos C on E.idEstilo=C.idEstilo where E.idEstilo = ${cursoDelFont.idEstilo};`);
            cursoNoId.Estilo = estilo.recordsets[0][0].NombreEstilo;
            let categorias = await pool.request().query(`SELECT TOP 1 NombreCategoria FROM Categoria CA INNER JOIN Cursos C ON CA.idCategoria = C.idCategorias WHERE C.idCategorias = ${cursoDelFont.idCategorias};`);
            cursoNoId.Categorias = categorias.recordsets[0][0].NombreCategoria;
            let areas = await pool.request().query(`SELECT TOP 1 NombreArea FROM Area A INNER JOIN Cursos C ON A.idAreas = C.idAreas WHERE C.idAreas = ${cursoDelFont.idAreas};`);
            cursoNoId.Areas = areas.recordsets[0][0].NombreArea;
            /*let idioma = await pool.request().query(`SELECT TOP 1 Idioma FROM Cursos_Idioma CI JOIN Idioma I ON CI.idIdioma = I.idIdioma JOIN Cursos C ON CI.idCurso = C.idCurso WHERE CI.idCurso = ${curso.idCurso}`);
            cursoNoId.Idioma = idioma.recordsets;*/
            console.log("cursoNoId", cursoNoId)
        }
        catch (error) {
            console.log(error)
        }
        return cursoNoId;
    }
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
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()            
            .query(`INSERT INTO Cursos (NombreDelCurso, ResumenCurso, PrecioDelCurso)
            VALUES ('${Curso.NombreDelCurso}', '${Curso.ResumenCurso}', '${Curso.PrecioDelCurso}')`);
            rowsAffected = result.rowsAffected;
            newCurso = await this.getByName(Curso.NombreDelCurso);
        } catch (error) {
            console.log(error);
        }
        return newCurso;
    }
}
    
export default Cursos_Services;