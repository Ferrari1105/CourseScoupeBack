import express from "express";
import Usuario_Services from './src/services/usuario-services.js'
import Cursos_Services from './src/services/cursos-services.js'
import cors from 'cors'
import jwtservice from "./middleware/auth.js";

const auth = new jwtservice();
const svcUsuario = new Usuario_Services();
const svcCursos = new Cursos_Services();
const app = express();
const port = 3000;
app.use(cors())
app.use(express.json())
app.get('/', (req, res) => {

    res.send('CourseScope');

})

app.listen(port, () => {
    console.log(`Pagina abierte en el puerto ${port}`)
})

//
/*
Preguntas a Juli
id lecciones tiene que ser uno a muchos o muchos a muchos y como se hace

*/
//
app.get('/Leccion/:id', async (req,res) => {
    let id = req.params.id
    let LeccionPorId;
    LeccionPorId = await svcCursos.getleccByID(id)
    return res.status(200).json(LeccionPorId)
})
app.get('/lecciones', async (req,res) => {
    const LeccionGetAll = await svcCursos.getAllLecciones()
    return res.status(200).json(LeccionGetAll)
})
app.get('/cursosTerminados', async (req, res) => {
    const CursosGetAll = await svcCursos.getAllCursosTerminados()
    return res.status(200).json(CursosGetAll)
})
app.post('/cursosByIdUsuario', async (req, res) => {
    let data = req.body
    const CursosGetAll = await svcCursos.getAllCursosByIdUsuario(data)
    return res.status(200).json(CursosGetAll)
})
app.get('/cursos', async (req, res) => {
    const CursosGetAll = await svcCursos.getAllCursos()
    return res.status(200).json(CursosGetAll)
})
app.post('/cursosById', async (req, res) => {
    let data = req.body
    console.log("ids para lista Cursos:", data)
    const CursosGetAllById = await svcCursos.getAllCursosById(data)
    return res.status(200).json(CursosGetAllById)
})
app.get('/Cursos/:id', async (req, res) => {
    //console.log("req.body", req.body)
    let id = req.params.id
    let CursoPorID;
    CursoPorID = await svcCursos.getByID(id)
    return res.status(200).json(CursoPorID)
})
app.post('/cargarCarrito', async (req, res) => {
    let data = req.body
    //console.log("ids para el carrito:", data)
    let carrito = await svcCursos.insertCarrito(data)
    return res.status(200).json(carrito)
})
app.post('/eliminarCursoDelCarrito', async (req, res) => {
    let data = req.body
    console.log("ids para ELIMINAR el carrito:", data)
    let carrito = await svcCursos.deleteCarrito(data)
    return res.status(200).json(carrito)
})
app.post('/eliminarTodoElCarrito', async (req, res) => {
    let data = req.body
    console.log("ids para ELIMINAR el carrito:", data)
    let carrito = await svcCursos.deleteTodoElCarrito(data)
    return res.status(200).json(carrito)
})
app.post('/traerCarrito', async (req, res) => {
    let data = req.body
    let carrito = await svcCursos.getAllCarrito(data)
    return res.status(200).json(carrito)
})
app.post('/CursoProcesado/:id', async (req, res) => {
    let idcurso = req.params.id
    let cursoNoId = await svcCursos.getCursosProcesados(idcurso)
    return res.status(200).json(cursoNoId)
})
app.post("/CrearCurso", async (req, res) => {
    console.log("qeu llega del body",req.body)
    if (req.body.idCurso != null)
    {
        try {
            const newCurso = await new Cursos_Services().updateCurso(req.body)
            return res.status(200).json(newCurso);
        } catch (error) {
            console.error(error);
            return res.status(500).json("Error en el servidor");
        }
        
       
    }
    else{   
      
        try {
            console.log("req.body crearCurso", req.body)
            const newCurso = await new Cursos_Services().crearCurso(req.body)
            console.log("se creo el curso:", newCurso)
            return res.status(200).json(newCurso);
        } catch (error) {
            console.error(error);
            return res.status(500).json("Error en el servidor");
        }
      
        
    }
});
// app.post("/UpdateCurso3", async (req, res) => {
//     try {
//         const newCurso = await new Cursos_Services().updateCurso(req.body)
//         return res.status(200).json(newCurso);
//     } catch (error) {
//         console.error(error);
//         return res.status(500).json("Error en el servidor");
//     }
// });
app.post("/MActualizarCurso", async (req, res) => {
    try {
        // Supongamos que tienes una función en tu servicio llamada "actualizarCurso" para actualizar el curso.
        const updatedCurso = await new Cursos_Services().updateCurso(req.body);
        
        if (!updatedCurso) {
            return res.status(404).json("Curso no encontrado"); // Si el curso no se encuentra, puedes devolver un error 404.
        }
        
        return res.status(200).json(updatedCurso);
    } catch (error) {
        console.error(error);
        return res.status(500).json("Error en el servidor");
    }
});



app.get("/Categorias", async (req, res) => {
     const CategoriaGetAll = await svcCursos.getAllCategorias()
     return res.status(200).json(CategoriaGetAll)
});  
app.get("/Areas", async (req, res) => {
     const AreaGetAll = await svcCursos.getAllAreas()
     return res.status(200).json(AreaGetAll)
});  
app.get("/Idiomas", async (req, res) => {
     const idiomasGetAll = await svcCursos.getAllIdiomas()
     return res.status(200).json(idiomasGetAll)
});  
app.get("/Estilos", async (req, res) => {
    const EstilosGetAll = await svcCursos.getAllEstilos()
    return res.status(200).json(EstilosGetAll)
});  

//
//
/*
LLAMADAS PARA USUARIOS
*/
//
//


async function getByName(nombre) {
    let data;
    data = await svcUsuario.getByName(nombre)

    return data
}

app.get('/usuarios/:name', async (req, res) => {

    let nombre = req.params.name

    const UsuarioPorNombre = await getByName(nombre);
    return res.status(200).json(UsuarioPorNombre)
})

async function getAll() {
    let data = await svcUsuario.getAllUsuarios()

    return data
}
app.get('/usuarios', async (req, res) => {
    const UsuariosGetAll = await getAll()
    return res.status(200).json(UsuariosGetAll)
})
//hacerlo /login y que no inserte sino qeu seleccione de la base de datos y agarrrar este sacar lo de jwt para el crear usuario

app.post("/usuarios", async (req, res) => {
    try {
       // console.log("req.body", req.body)
        const newUser = await new Usuario_Services().insertUsuario(req.body)
       // console.log("userss", newUser)
        const token = auth.createToken(newUser);
       // console.log("token", token);
        return res.status(200).json(newUser);
    } catch (error) {
        console.error(error);
        return res.status(500).json("Error en el servidor");
    }
});
app.use(auth.checktoken);

//hacerlo /login



