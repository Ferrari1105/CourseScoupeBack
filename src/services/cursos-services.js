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
            console.log("le llega el curso" ,cursoDelFront)
            cursoNoId.idCurso = cursoDelFront.idCurso;
            cursoNoId.Adelanto = cursoDelFront.Adelanto;
            cursoNoId.HechoConIa = cursoDelFront.HechoConIa;
            cursoNoId.NombreDelCurso = cursoDelFront.NombreDelCurso;
            cursoNoId.PortadaCurso = cursoDelFront.PortadaCurso;
            cursoNoId.PrecioDelCurso = cursoDelFront.PrecioDelCurso;
            cursoNoId.ResumenCurso = cursoDelFront.ResumenCurso;
            cursoNoId.NivelCurso = curso.NivelCurso;
            cursoNoId.NumeroEstudiantes = curso.NumeroEstudiantes;
            cursoNoId.Valoracion = curso.Valoracion;
            
            let pool = await sql.connect(config);
            let estilo = await pool.request().query(`SELECT TOP 1 NombreEstilo FROM Estilo E JOIN Cursos C on E.idEstilo=C.idEstilo where E.idEstilo = ${cursoDelFront.idEstilo};`);
            console.log(estilo)
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
    getAllCursosByIdUsuario = async (id) => {
        let returnObject = null;
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .input('pidCreador', sql.Int, id.IdUsuario)
                .query("SELECT * FROM Cursos WHERE Terminado = 0 AND idCreador = @pidCreador;");
    
            returnObject = result.recordsets[0][0];
    
            if (returnObject) {
                let leccionesResult = await pool.request()
                    .input('pIdCurso', sql.Int, returnObject.idCurso)
                    .query("SELECT NombreLeccion, ContenidoLeccion FROM Leccion WHERE idCursos = @pIdCurso;");
    
                returnObject.lecciones = leccionesResult.recordsets[0];
                console.log("El curso que le falta terminar es", returnObject);
            } else {
                console.log("No se encontraron cursos para el usuario con ID:", id.IdUsuario);
            }
    
        } catch (error) {
            console.log(error);
        }
        return returnObject;
    }
    
    
    getAllCursosTerminados = async () => {
        let returnArray = null;
    
        try {
            let pool = await sql.connect(config);
           let result = await pool.request().query("SELECT * FROM Cursos WHERE Terminado = 1 ");
           returnArray = result.recordsets[0];
        }
        catch (error){
            console.log(error)
        }
        return returnArray;
        }
    getAllLecciones = async () => {
        let returnArray = null;
    
        try {
            let pool = await sql.connect(config);
           let result = await pool.request().query("SELECT * FROM Leccion");
           returnArray = result.recordsets[0];
        }
        catch (error){
            console.log(error)
        }
        return returnArray;
        }


        getLeccionesByID = async (idLeccion) => {
        let returnEntity = null;
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pidLeccion', sql.Int ,idLeccion)
            .query('SELECT * FROM Leccion WHERE idLeccion = @pidLeccion');
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
     getAllCursosById = async (Ids) => {
        let returnArray = [];
        console.log("IDs:", Ids);
    
        for (const id of Ids) {
            try {
                let pool = await sql.connect(config);
                const result = await pool.request().query(`SELECT * FROM Cursos WHERE idCurso = ${id.idCurso}`);
                returnArray.push(...result.recordsets[0]);
               // console.log("Curso encontrado:", result.recordsets[0]);
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
    getleccByID = async (idCurso) => {
        let returnEntity = null;
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pidCurso', sql.Int ,idCurso)
            .query('SELECT * FROM Leccion WHERE idCursos = @pidCurso');
            returnEntity = result.recordsets[0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
    crearCurso = async (Curso, Adelanto, recAdicionales) => {
        let rowsAffected = 0;
        let newCurso = null;
        console.log("Curso a crear: ", Curso);
        try {
            let pool = await sql.connect(config);
            let result1 = await pool.request()
                .input('NombreDelCurso', sql.NVarChar, Curso.NombreDelCurso)
                .input('HechoConIa', sql.Bit, Curso.HechoConIa)
                .input('idCategorias', sql.Int, Curso.idCategorias)
                .input('idAreas', sql.Int, Curso.idAreas)
                .input('idEstilo', sql.Int, Curso.idEstilo)
                .input('PrecioDelCurso', sql.Decimal, Curso.PrecioDelCurso)
                .input('ResumenCurso', sql.NVarChar, Curso.ResumenCurso)
                .input('PortadaCurso', sql.NVarChar, Curso.PortadaCurso)
                .input('idCreador', sql.Int, Curso.idCreador)
                .input('NumeroEstudiantes', sql.Int, Curso.NumeroEstudiantes)
                .input('Terminado', sql.Bit, Curso.Terminado)
                .input('Adelanto', sql.NVarChar, Curso.ContenidosCurso) // Nuevo campo
                //.input('recAdicionales', sql.NVarChar, Curso.recAdicionales) // Nuevo campo
                .query(`
                    INSERT INTO Cursos 
                    (NombreDelCurso, HechoConIa, idCategorias, idAreas, idEstilo, PrecioDelCurso, ResumenCurso, PortadaCurso, idCreador, NumeroEstudiantes, Terminado, Adelanto)
                    VALUES 
                    (@NombreDelCurso, @HechoConIa, @idCategorias, @idAreas, @idEstilo, @PrecioDelCurso, @ResumenCurso, @PortadaCurso, @idCreador, @NumeroEstudiantes, @Terminado, @Adelanto)
                `);
            rowsAffected = result1.rowsAffected[0];
            newCurso = await this.getByName(Curso.NombreDelCurso);
        } catch (error) {
            console.log(error);
        }
        return newCurso;
    }
    
    updateCurso = async (Curso, Adelanto, recAdicionales) => {
        let rowsAffected = 0;
        let updatedCurso = null;
        console.log("Actualizando el curso: ", Curso);
        try {
            let pool = await sql.connect(config);
    
            // Utilizar parámetros con sql.input para evitar SQL Injection y manejar propiedades undefined
            let updateCursoQuery = `
                UPDATE Cursos SET 
                NombreDelCurso = @NombreDelCurso,
                idCategorias = @idCategorias,
                idAreas = @idAreas,
                idEstilo = @idEstilo,
                PrecioDelCurso = @PrecioDelCurso,
                ResumenCurso = @ResumenCurso,
                PortadaCurso = @PortadaCurso,
                NumeroEstudiantes = @NumeroEstudiantes,
                Terminado = @Terminado, 
                Adelanto = @Adelanto,
                recAdicionales = @recAdicionales
                WHERE idCurso = @idCurso
            `;
    
            let result = await pool.request()
                .input('NombreDelCurso', sql.NVarChar, Curso.NombreDelCurso)
                .input('idCategorias', sql.Int, Curso.idCategorias)
                .input('idAreas', sql.Int, Curso.idAreas)
                .input('idEstilo', sql.Int, Curso.idEstilo)
                .input('PrecioDelCurso', sql.Decimal, Curso.PrecioDelCurso)
                .input('ResumenCurso', sql.NVarChar, Curso.ResumenCurso)
                .input('PortadaCurso', sql.NVarChar, Curso.PortadaCurso)
                .input('NumeroEstudiantes', sql.Int, Curso.NumeroEstudiantes)
                .input('Terminado', sql.Bit, Curso.Terminado ? 1 : 0)
                .input('Adelanto', sql.NVarChar, Curso.ContenidosCurso) // Nuevo campo
                .input('recAdicionales', sql.NVarChar, Curso.recAdicionales) // Nuevo campo
                .input('idCurso', sql.Int, Curso.idCurso)
                .query(updateCursoQuery);
    
    
                // Eliminar las lecciones actuales asociadas al curso
                await pool.request()
                    .input('idCursos', sql.Int, Curso.idCurso)
                    .query('DELETE FROM Leccion WHERE idCursos = @idCursos');// Insertar las nuevas lecciones asociadas al curso
                if(Curso.Lessons){

                                        for (const leccion of Curso.Lessons) {
                                            try {
                                                await pool.request()
                                                .input('NombreLeccion', sql.NVarChar, leccion.title)
                                                .input('ContenidoLeccion', sql.NVarChar, leccion.content)
                            .input('idCursos', sql.Int, Curso.idCurso)
                            .query(`INSERT INTO Leccion (NombreLeccion, ContenidoLeccion, idCursos) 
                            VALUES (@NombreLeccion, @ContenidoLeccion, @idCursos)`);
                        } catch (error) {
                            console.log(error);
                        }
                    }
                }
    
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
    deleteCarrito = async (ids) => {

        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .query(`DELETE FROM Carrito WHERE idCurso = ${ids.idCurso} AND idUsuario = ${ids.idUsuario}`);
            console.log("Se eliminó el carrito");
        } catch (error) {
            console.log(error);
        }
    }
    deleteTodoElCarrito = async (ids) => {
                console.log("ids qeu voy a eliminar yA", ids)
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .query(`DELETE FROM Carrito WHERE idUsuario = ${ids.idUsuario}`);
            console.log("Se eliminó el carrito del usuario con id:", ids.idUsuario);
        } catch (error) {
            console.log(error);
        }
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