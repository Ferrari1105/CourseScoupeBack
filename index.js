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
app.get('/cursos', async (req, res) => {
    const CursosGetAll = await svcCursos.getAllCursos()
    return res.status(200).json(CursosGetAll)
})
app.get('/Cursos/:id', async (req, res) => {
    //console.log("req.body", req.body)
    let id = req.params.id
    let CursoPorID;
    CursoPorID = await svcCursos.getByID(id)
    return res.status(200).json(CursoPorID)
})
app.get('/CursoProcesado/:id', async (req, res) => {
    let idcurso = req.params.id
    console.log("id", idcurso)
    let cursoNoId = await svcCursos.getCursosProcesados(idcurso)
    console.log("cursoNoId", cursoNoId)
    return res.status(200).json(cursoNoId)
})
app.post("/MCrearCurso3", async (req, res) => {
    try {
        const newCurso = await new Cursos_Services().insertCurso(req.body)
        return res.status(200).json(newCurso);
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



