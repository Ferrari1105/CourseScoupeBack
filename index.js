import express from "express";
import Usuario_Services from './src/services/usuario-services.js'
import cors from 'cors'

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
    console.log(data);
    return data
}

app.get('/usuarios/:name',async (req,res) =>{
    console.log("hola")
    let nombre = req.params.name
    console.log(nombre)
    const UsuarioPorNombre = await getByName(nombre);
    return res.status(200).json(UsuarioPorNombre)
})  





async function getAll(){
    let data = await svcUsuario.getAllUsuarios()
    console.log(data);
    return data
}
app.get('/usuarios',async (req,res) =>{
    const UsuariosGetAll = await getAll()
    return res.status(200).json(UsuariosGetAll)
})
