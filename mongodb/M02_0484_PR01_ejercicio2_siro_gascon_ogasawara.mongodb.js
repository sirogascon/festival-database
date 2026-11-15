// M02_0484_PR01 - Parte 3 NoSQL
// Ejercicio 2: Colección objetos_perdidos

use("SGO_fib2025_nosql");

// Reinicio de la colección para no duplicar datos
db.objetos_perdidos.drop();
db.objetos_perdidos = db.getCollection("objetos_perdidos");


// 1) CREATE (insertar documentos)
db.objetos_perdidos.insertMany([
  {
    tipo: "Móvil",
    marca: "Samsung",
    color: "Negro",
    zona_encontrado: "Escenario Principal",
    fecha_encontrado: "2025-07-05",
    estado: "en custodia"
  },
  {
    tipo: "Cartera",
    marca: "Desconocida",
    color: "Marrón",
    zona_encontrado: "Zona food trucks",
    fecha_encontrado: "2025-07-04",
    estado: "devuelto",
    contenido: { tiene_dni: true, tiene_tarjetas: true }
  },
  {
    tipo: "Chaqueta",
    marca: "Zara",
    color: "Azul",
    zona_encontrado: "Escenario Secundario",
    fecha_encontrado: "2025-07-06",
    estado: "en custodia",
    talla: "M"
  },
  {
    tipo: "Gafas",
    marca: "Ray-Ban",
    color: "Negro",
    zona_encontrado: "Baños",
    fecha_encontrado: "2025-07-05",
    estado: "en custodia"
  },
  {
    tipo: "Llaves",
    marca: "Desconocida",
    color: "Plateado",
    zona_encontrado: "Entrada principal",
    fecha_encontrado: "2025-07-04",
    estado: "en custodia",
    llavero: "FC Barcelona"
  }
]);


// 2) READ (consultas)
db.objetos_perdidos.find({ estado: "en custodia" });

db.objetos_perdidos.find({ zona_encontrado: "Zona food trucks" });

db.objetos_perdidos.find({
  estado: "en custodia",
  color: "Negro"
});


// 3) UPDATE (modificar un documento)
// Cambiar estado a "devuelto" para un objeto tipo "Gafas"
db.objetos_perdidos.updateOne(
  { tipo: "Gafas", marca: "Ray-Ban" },
  { $set: { estado: "devuelto" } }
);


// 4) DELETE (borrar un documento)
// Borrar el objeto tipo "Llaves"
db.objetos_perdidos.deleteOne({ tipo: "Llaves" });



// Reflexión final:
// MariaDB resulta más práctico para la gestión de datos estructurados
// y relaciones complejas como asistentes, entradas o consumiciones.
// En cambio, MongoDB va muy bien para datos variables 
// como artistas u objetos perdidos.
// SQL me asegura consistencia y MongoDB me da flexibilidad.
