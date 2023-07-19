<?php
// Conexión a la base de datos
$conexion = mysqli_connect("localhost", "root", "", "arrays_daniela");

// Comprobar si la conexión fue exitosa
if (mysqli_connect_errno()) {
  echo "Error al conectar a la base de datos: " . mysqli_connect_error();
  exit();
}

$conexion->set_charset("utf8mb4");
// Consulta para obtener los registros de compras con los datos adicionales de las demás tablas
$query = "SELECT registro_compras.*, calzado.calzado, calzado.tipo, calzado.modelo, calzado.marca, calzado.talla, calzado.precio, personas.nombre, personas.apellido, personas.edad, personas.telefono FROM registro_compras INNER JOIN calzado ON registro_compras.codigo_calzado = calzado.codigo INNER JOIN personas ON registro_compras.cedula_comprador = personas.cedula";

// Ejecutar la consulta
$resultado = mysqli_query($conexion, $query);

// Crear un array para almacenar los registros de compras
$registros_compras = array();

// Recorrer los resultados y agregarlos al array
while ($fila = mysqli_fetch_assoc($resultado)) {
  $registros_compras[] = $fila;
}

// Cerrar la conexión a la base de datos
mysqli_close($conexion);
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Registros de compras</title>
    <style>
      /* Estilos para la tabla */
table {
  border-collapse: collapse;
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
  margin-top: 30px;
  margin-bottom: 30px;
}

th, td {
  padding: 10px;
  text-align: left;
}

th {
  background-color: #0077b6;
  color: white;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* Estilos para el encabezado */
h1 {
  text-align: center;
  margin-top: 50px;
  margin-bottom: 30px;
}

/* Estilos para los párrafos */
p {
  margin: 0;
  margin-bottom: 10px;
}

/* Estilos para el cuerpo de la página */
body {
  font-family: Arial, sans-serif;
  background-color: #f8f8f8;
}

/* Estilos para los enlaces */
a {
  color: #0077b6;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}
    </style>
  </head>
  <body>
    <h1>Registros de compras</h1>
    <table border="1">
      <thead>
        <tr>
          <th>Fecha y hora</th>
          <th>Comprador</th>
          <th>Calzado</th>
          <th>Marca</th>
          <th>Talla</th>
          <th>Precio</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($registros_compras as $registro_compra): ?>
          <tr>
            <td><?php echo $registro_compra['fecha'] . ' ' . $registro_compra['hora']; ?></td>
            <td><?php echo $registro_compra['nombre'] . ' ' . $registro_compra['apellido'] . ', ' . $registro_compra['edad'] . ' años, teléfono: ' . $registro_compra['telefono']; ?></td>
            <td><?php echo $registro_compra['calzado'] . ' ' . $registro_compra['tipo'] . ' ' . $registro_compra['modelo']; ?></td>
            <td><?php echo $registro_compra['marca']; ?></td>
            <td><?php echo $registro_compra['talla']; ?></td>
            <td><?php echo '$' . $registro_compra['precio']; ?></td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </body>
</html>