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
}
app.get('/usuariosXNombre',async (req,res) =>{
    let nombre = req.query.usuario
    console.log(nombre)
    const UsuarioPorNombre = await getByName(nombre);
    return res.status(200).json(UsuarioPorNombre)
})  