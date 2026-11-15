// M02_0484_PR01 - Parte 3 NoSQL
// Opción A: artistas en MongoDB

use("SGO_fib2025_nosql");

db.artistas.drop();
db.createCollection("artistas");

db.artistas.insertMany([
  {
    nombre_artistico: "Rosalía",
    pais: "España",
    genero: "Pop",
    n_miembros: 1,
    redes_sociales: { instagram: "@rosalia.vt" }
  },
  {
    nombre_artistico: "Imagine Dragons",
    pais: "Estados Unidos",
    genero: "Pop Rock",
    n_miembros: 4
  },
  {
    nombre_artistico: "Estopa",
    pais: "España",
    genero: "Rumba Rock",
    n_miembros: 2
  },
  {
    nombre_artistico: "Vetusta Morla",
    pais: "España",
    genero: "Indie Rock",
    n_miembros: 6
  },
  {
    nombre_artistico: "Coldplay",
    pais: "Reino Unido",
    genero: "Pop Rock",
    n_miembros: 4,
    redes_sociales: { instagram: "@coldplay" }
  }
]);

// 1) Artistas con más de 3 miembros
db.artistas.find({ n_miembros: { $gt: 3 } });

// 2) Artistas que tengan Instagram
db.artistas.find({ "redes_sociales.instagram": { $exists: true } });

// 3) Artistas con más de 3 miembros y con Instagram
db.artistas.find({
  n_miembros: { $gt: 3 },
  "redes_sociales.instagram": { $exists: true }
});
