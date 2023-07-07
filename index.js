import express from "express";
import Usuario_Services from './src/services/usuario-services.js'
import cors from 'cors'
import jwtservice from "./middleware/auth.js";

const auth = new jwtservice();
const svcUsuario = new Usuario_Services();
const app= express();
const port= 3000;
app.use(cors())
app.use(express.json())
app.get('/', (req,res)=>{
    
    res.send('CourseScope');
    
})

app.listen(port,()=> {
    console.log(`Pagina abierte en el puerto ${port}`)
})



async function getByName(nombre){
    let data;
    data = await svcUsuario.getByName(nombre)

    return data
}

app.get('/usuarios/:name',async (req,res) =>{

    let nombre = req.params.name

    const UsuarioPorNombre = await getByName(nombre);
    return res.status(200).json(UsuarioPorNombre)
})  

async function getAll(){
    let data = await svcUsuario.getAllUsuarios()

    return data
}
app.get('/usuarios',async (req,res) =>{
    const UsuariosGetAll = await getAll()
    return res.status(200).json(UsuariosGetAll)
})


  app.post("/usuarios", async (req, res) => {
    try {
        console.log("req.body", req.body)
      const newUser = await new Usuario_Services().insertUsuario(req.body)
      
      return res.status(200).json(newUser);
    } catch (error) {
        console.error(error);
        return res.status(500).json("Error en el servidor");
    }
});
  app.use(auth.checktoken);
