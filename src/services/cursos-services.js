import config from '../../dbconfig-env.js';
import sql from 'mssql'

class Cursos_Services{
    getCursosProcesados = async (curso) => {
        let cursoDelFront = await this.getByID(curso);

        const cursoNoId = {
            idCurso:"",
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
            Lecciones:""
          };
        try {
            cursoNoId.idCurso = cursoDelFront.idCurso;
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
            
            let pool = await sql.connect(config);
            let estilo = await pool.request().query(`SELECT TOP 1 NombreEstilo FROM Estilo E JOIN Cursos C on E.idEstilo=C.idEstilo where E.idEstilo = ${cursoDelFront.idEstilo};`);
            cursoNoId.Estilo = estilo.recordsets[0][0].NombreEstilo;
            let categorias = await pool.request().query(`SELECT TOP 1 NombreCategoria FROM Categoria CA INNER JOIN Cursos C ON CA.idCategoria = C.idCategorias WHERE C.idCategorias = ${cursoDelFront.idCategorias};`);
            cursoNoId.Categorias = categorias.recordsets[0][0].NombreCategoria;
            let areas = await pool.request().query(`SELECT TOP 1 NombreArea FROM Area A INNER JOIN Cursos C ON A.idAreas = C.idAreas WHERE C.idAreas = ${cursoDelFront.idAreas};`);
            cursoNoId.Areas = areas.recordsets[0][0].NombreArea;
            let Creador = await pool.request().query(`SELECT TOP 1 NombreUsuario FROM Usuario U INNER JOIN Cursos C ON U.IdUsuario = C.idCreador WHERE C.idCreador = ${cursoDelFront.idCreador};`);
            cursoNoId.Creador = Creador.recordsets[0][0].NombreUsuario;
            let lecciones = await pool.request().query(`SELECT NombreLeccion, ContenidoLeccion FROM Leccion L INNER JOIN Cursos C ON L.idCursos = C.idCurso WHERE L.idCursos = ${cursoDelFront.idCurso};`);
            cursoNoId.Lecciones =lecciones.recordsets[0];
            /*let idioma = await pool.request().query(`SELECT TOP 1 Idioma FROM Cursos_Idioma CI JOIN Idioma I ON CI.idIdioma = I.idIdioma JOIN Cursos C ON CI.idCurso = C.idCurso WHERE CI.idCurso = ${curso.idCurso}`);
            cursoNoId.Idioma = idioma.recordsets;*/
            console.log("Cambiando el curso a: ",cursoNoId);
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
     getAllCursosById = async (Ids) => {
        let returnArray = [];
        console.log("IDs:", Ids);
    
        for (const id of Ids) {
            try {
                let pool = await sql.connect(config);
                const result = await pool.request().query(`SELECT * FROM Cursos WHERE idCurso = ${id.idCurso}`);
                returnArray.push(...result.recordsets[0]);
                console.log("Curso encontrado:", result.recordsets[0]);
            } catch (error) {
                console.log(error);
            }
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
                .input('pNombreDelCurso', sql.NVarChar, NombreDelCurso) // Cambiar sql.Text a sql.NVarChar
                .query('SELECT * FROM Cursos WHERE NombreDelCurso = CAST(@pNombreDelCurso AS nvarchar(max))'); // Convertir NombreDelCurso
            returnEntity = result.recordsets[0][0];
            console.log("Curso Nuevo Con Id:", returnEntity)
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
crearCurso = async (Curso) => {
    let rowsAffected = 0;
    let newCurso = null;
    console.log("Curso a crear: ", Curso);
    try {
        let pool = await sql.connect(config);
        console.log("golaaaaaaaaaadasdasdasd");
        let result1 = await pool.request()
            .input('NombreDelCurso', sql.NVarChar, Curso.NombreDelCurso)
            .input('HechoConIa', sql.Bit, Curso.HechoConIa)
            .input('idCategorias', sql.Int, Curso.idCategorias)
            .input('idAreas', sql.Int, Curso.idAreas)
            .input('Style', sql.Int, Curso.Style)
            .input('PrecioDelCurso', sql.Decimal, Curso.PrecioDelCurso)
            .input('ResumenCurso', sql.NVarChar, Curso.ResumenCurso)
            .input('PortadaCurso', sql.NVarChar, Curso.PortadaCurso)
            .input('idCreador', sql.Int, Curso.idCreador)
            .query(`
                INSERT INTO Cursos 
                (NombreDelCurso, HechoConIa, idCategorias, idAreas, idEstilo, PrecioDelCurso, ResumenCurso, PortadaCurso, idCreador)
                VALUES 
                (@NombreDelCurso, @HechoConIa, @idCategorias, @idAreas, @Style, @PrecioDelCurso, @ResumenCurso, @PortadaCurso, @idCreador)
            `);
        rowsAffected = result1.rowsAffected[0];
        console.log("golaaaaaaaaaaaaa1");
        newCurso = await this.getByName(Curso.NombreDelCurso);
    } catch (error) {
        console.log(error);
    }
    return newCurso;
}
    

updateCurso = async (Curso) => {
    let rowsAffected = 0;
    let updatedCurso = null;
    console.log("updateando el curso: ", Curso);
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .query(`UPDATE Cursos SET 
                    NombreDelCurso = '${Curso.NombreDelCurso}',
                    idCategorias = ${Curso.idCategorias},
                    idAreas = ${Curso.idAreas},
                    idEstilo = ${Curso.Style},
                    PrecioDelCurso = ${Curso.PrecioDelCurso},
                    ResumenCurso = '${Curso.ResumenCurso}',
                    PortadaCurso = '${Curso.PortadaCurso}'
                    WHERE idCurso = ${Curso.idCurso}`);
          Curso.Lessons.map(async (curso) => {
    try {
        const result = await pool.request()
            .input('NombreLeccion', sql.NVarChar, curso.title)
            .input('ContenidoLeccion', sql.NVarChar, curso.content)
            .input('idCursos', sql.Int, curso.idCurso)  // Usando curso.idCurso en lugar de idCursoNuevo
            .query(`INSERT INTO Leccion (NombreLeccion, ContenidoLeccion, idCursos) 
                    VALUES (@NombreLeccion, @ContenidoLeccion, @idCursos)`);
    } catch (error) {
        console.log(error);
    }
});

        rowsAffected = result.rowsAffected[0];

        if (rowsAffected > 0) {
            // La actualización tuvo éxito, puedes obtener el curso actualizado.
            updatedCurso = await this.getByID(Curso.idCurso); // Suponiendo que tengas una función getById para obtener el curso por su ID.
        }
    } catch (error) {
        console.log(error);
    }
    return updatedCurso;
}

    getAllCarrito = async (usuario) => {
        let returnArray = null;
        try {
            let pool = await sql.connect(config);
            let result = await pool.request().query(`SELECT * FROM Carrito WHERE idUsuario = ${usuario.IdUsuario}`);
            returnArray = result.recordsets[0];
        }
        catch (error) {
            console.log(error)
        }
        return returnArray;
    }
    updateCarrito = async (Carrito) => {
    }
    insertCarrito = async (ids) => {      
        console.log("Carrito",ids)
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .query(`INSERT INTO Carrito (idCurso, idUsuario) VALUES (${ids.idCurso}, ${ids.idUsuario})`);
                console.log("se cargo el carrito")
        } catch (error) {
            console.log(error);
        }
    }

}
    
export default Cursos_Services;



//cosas que por ahi no hay que borrar 
    /*crearCurso = async () => {
        let idNuevoCurso = null;
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .query("INSERT INTO Cursos (NombreDelCurso) VALUES ('Nuevo Curso'); SELECT SCOPE_IDENTITY() AS idCurso;");
            
            // Obtener el idCurso generado automáticamente
            idNuevoCurso = result.recordset[0].idCurso;
        } catch (error) {
            console.log(error);
        }
        return idNuevoCurso;
    }*/
   /* insertLeccion = async (curso) => {
        let idNuevaLeccion = null;
        try {
            let pool = await sql.connect(config);
    
            // Primero, insertamos la nueva lección y obtenemos su ID
            let result = await pool.request()
                .query(`INSERT INTO Leccion (NombreLeccion, ContenidoLeccion, idCursos) 
                        VALUES ('Titulo', 'Contenido', ${curso.idCurso});`);
            
            // Obtener el idLeccion generado automáticamente
            idNuevaLeccion = result.recordset[0];
        } catch (error) {
            console.log(error);
        }
        return idNuevaLeccion;
    }*/
    /*updateLeccion = async (idCurso, idLeccion, nuevoNombre, nuevoContenido) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .query(`UPDATE Leccion 
                        SET NombreLeccion = '${nuevoNombre}', 
                            ContenidoLeccion = '${nuevoContenido}' 
                        WHERE idCursos = ${idCurso} AND idLeccion = ${idLeccion}`);
            
            if (result.rowsAffected[0] > 0) {
                // La actualización tuvo éxito
                console.log(`La lección con idLeccion ${idLeccion} en el curso con idCurso ${idCurso} ha sido actualizada.`);
            } else {
                console.log(`No se encontró ninguna lección con idLeccion ${idLeccion} en el curso con idCurso ${idCurso}.`);
            }
        } catch (error) {
            console.log(error);
        }
    }*/
  /*  deleteLeccion = async (idCurso, idLeccion) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .query(`DELETE FROM Leccion 
                        WHERE idCursos = ${idCurso} AND idLeccion = ${idLeccion}`);
            
            if (result.rowsAffected[0] > 0) {
                // La eliminación tuvo éxito
                console.log(`La lección con idLeccion ${idLeccion} en el curso con idCurso ${idCurso} ha sido eliminada.`);
            } else {
                console.log(`No se encontró ninguna lección con idLeccion ${idLeccion} en el curso con idCurso ${idCurso}.`);
            }
        } catch (error) {
            console.log(error);
        }
    }*/