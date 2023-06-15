import express from "express";
import Usuario_Services from './src/services/usuario-services.js'
import Usuario from './src/models/usuario.js'
const svcUsuario=new Usuario_Services();

const app= express();
const port= 3000;

app.get('/', (req,res)=>{
    res.send('CourseScope');
})

app.listen(port,()=> {
    console.log(`Pagina abierte en el puerto ${port}`)
})

app.get('/usuarios',async (req,res) =>{
    const UsuariosGetAll = await svcUsuario.getAll();
    return res.status(200).json(UsuariosGetAll)
})