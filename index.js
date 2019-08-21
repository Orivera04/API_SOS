/* Librerias a ultilizar */
require('dotenv').config();

/* Inicialización de variables */
const Express = require('express');
const Logger = require('morgan');
const BodyParser = require('body-parser');
const StageBundle = require('./config.json');
const StageConfig = StageBundle.development;
const APP = Express();
const Router = Express.Router();
const InventarioRoutes = require('./routes/inventario.Routes.js');
var MysqlDB = require('mysql');
var Log = require('./log.js');
var Cors=require('cors');



/* Configurando peticiones */
APP.use(BodyParser.json());
APP.use(Cors({origin:true,credentials: true}));
APP.use(BodyParser.urlencoded({
    extended: true
}));

/* Configurando conexion con la BD */
var Conexion = MysqlDB.createPool({
    connectionLimit: 100,
    host: process.env.BD_CONECTIONSTRING,
    user: process.env.BD_USER,
    password: process.env.BD_PASSWORD,
    database: process.env.BD_NAME,
    debug: false
});


/* Configurando Middleware de BD */
APP.use((Request, Response, Next) => {
    Request.BD = Conexion;
    Request.Log = Log;
    Next();
});

/* Pretty Print */
APP.set('json spaces', 2);

/* Inicializando morgan para depurar las peticiones */
APP.use(Logger('dev'));

/* Definiendo las rutas */
APP.use('/api/v1', Router);
InventarioRoutes(Router);

/* Configurando Listener de la APP */
APP.listen(process.env.PORT || 3000, () => {
    console.log(`-> El servidor esta arriba en el puerto :${StageConfig.node_port}`);
});

module.exports = APP;