import config from '../../dbconfig-env.js';
import sql from 'mssql'

class Cursos_Services{
    getCursosProcesados = async (curso) => {
        let cursoDelFront = await this.getByID(curso);

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
            cursoNoId.Adelanto = cursoDelFront.Adelanto;
         //   cursoNoId.HechoConIa = cursoDelFront.HechoConIa;
            cursoNoId.NombreDelCurso = cursoDelFront.NombreDelCurso;
            cursoNoId.PortadaCurso = cursoDelFront.PortadaCurso;
            cursoNoId.PrecioDelCurso = cursoDelFront.PrecioDelCurso;
            cursoNoId.ResumenCurso = cursoDelFront.ResumenCurso;
            //cursoNoId.NivelCurso = curso.NivelCurso;
            //cursoNoId.NumeroEstudiantes = curso.NumeroEstudiantes;
            //cursoNoId.Valoracion = curso.Valoracion;
            //cursoNoId.ImagenCursos = curso.ImagenCursos;
            //cursoNoId.cantLecciones = curso.cantLecciones;
            let pool = await sql.connect(config);
            let estilo = await pool.request().query(`SELECT TOP 1 NombreEstilo FROM Estilo E JOIN Cursos C on E.idEstilo=C.idEstilo where E.idEstilo = ${cursoDelFront.idEstilo};`);
            cursoNoId.Estilo = estilo.recordsets[0][0].NombreEstilo;
            let categorias = await pool.request().query(`SELECT TOP 1 NombreCategoria FROM Categoria CA INNER JOIN Cursos C ON CA.idCategoria = C.idCategorias WHERE C.idCategorias = ${cursoDelFront.idCategorias};`);
            cursoNoId.Categorias = categorias.recordsets[0][0].NombreCategoria;
            let areas = await pool.request().query(`SELECT TOP 1 NombreArea FROM Area A INNER JOIN Cursos C ON A.idAreas = C.idAreas WHERE C.idAreas = ${cursoDelFront.idAreas};`);
            cursoNoId.Areas = areas.recordsets[0][0].NombreArea;
            let Creador = await pool.request().query(`SELECT TOP 1 NombreUsuario FROM Usuario U INNER JOIN Cursos C ON U.IdUsuario = C.idCreador WHERE C.idCreador = ${cursoDelFront.idCreador};`);
            cursoNoId.Creador = Creador.recordsets[0][0].NombreUsuario;
            /*let idioma = await pool.request().query(`SELECT TOP 1 Idioma FROM Cursos_Idioma CI JOIN Idioma I ON CI.idIdioma = I.idIdioma JOIN Cursos C ON CI.idCurso = C.idCurso WHERE CI.idCurso = ${curso.idCurso}`);
            cursoNoId.Idioma = idioma.recordsets;*/
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
    getAllEstilos = async () => {
        let returnArray = null;

        try {
            let pool = await sql.connect(config);
            let result = await pool.request().query("SELECT * FROM Estilo");
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
            .query(`INSERT INTO Cursos (NombreDelCurso,HechoConIa,idCategorias,idAreas,idEstilo,PrecioDelCurso, ResumenCurso, PortadaCurso,idCreador )
            VALUES ('${Curso.NombreDelCurso}','${Curso.HechoConIa}','${Curso.idCategorias}','${Curso.idAreas}','${Curso.Style}','${Curso.PrecioDelCurso}', '${Curso.ResumenCurso}','${Curso.PortadaCurso}','${Curso.idCreador}')`);
            rowsAffected = result.rowsAffected;
            newCurso = await this.getByName(Curso.NombreDelCurso);
        } catch (error) {
            console.log(error);
        }
        return newCurso;    
    }
}
    
export default Cursos_Services;