import config from '../../dbconfig-env.js';
import sql from 'mssql'
const { google } = require('googleapis');
const key = require('./ruta-a-tu-archivo-json-de-credenciales');

const auth = new google.auth.GoogleAuth({
  keyFile: key,
  scopes: ['https://www.googleapis.com/auth/drive'],
});

const drive = google.drive({ version: 'v3', auth });

//Crear Archivo de Drive
drive.files.create(
  {
    name:'ejemploCracion',
    resource: fileMetadata,
    media: media,
    fields: 'id',
  },
  (err, file) => {
    if (err) {
      console.error(err);
      return;
    }
    const fileId = file.data.id;
    console.log('ID del archivo:', fileId);
  }
);

drive.files.list(
  {
    q: "name='ejemploCracion.txt'", // Nombre del archivo a buscar
    fields: 'files(id)',
  },
  (err, response) => {
    if (err) {
      console.error(err);
      return;
    }
    const files = response.data.files;
    if (files.length === 0) {
      console.log('No se encontró el archivo.');
    } else {
      const fileId = files[0].id;
      console.log('ID del archivo:', fileId);
    }
  }
);
drive.files.get(
  {
    fileId: 'ID-del-archivo',
    fields: 'webViewLink',
  },
  (err, file) => {
    if (err) {
      console.error(err);
      return;
    }

    const webViewLink = file.data.webViewLink;

    // Guarda la ubicación del archivo 
    const query = 'INSERT INTO Cursos (RegistroCursos) VALUES (?)';
    connection.query(query, [webViewLink], (error, results, fields) => {
      if (error) {
        console.error(error);
      } else {
        console.log('Registro guardado en la base de datos.');
      }
    });

    connection.end();
  }
);
class drive_services{



  
}
export default drive_services;