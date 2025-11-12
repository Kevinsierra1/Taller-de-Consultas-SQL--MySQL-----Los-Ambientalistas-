# Sistema de Información "Los Ambientalistas"

Sistema de gestión de información para parques naturales, desarrollado en MySQL.

## Descripción

Base de datos diseñada para administrar información sobre parques naturales, incluyendo:
- Departamentos y entidades administrativas
- Parques naturales y sus áreas
- Personal (gestión, vigilancia, investigación, conservación)
- Visitantes y alojamientos
- Especies (vegetales, animales, minerales)
- Proyectos de investigación
- Vehículos y entradas

## Estructura de la Base de Datos

### Tablas Principales

- **departamento** - Regiones y departamentos
- **entidad** - Entidades administrativas
- **parque_natural** - Parques naturales registrados
- **area2** - Áreas dentro de los parques
- **alojamiento** - Tipos de hospedaje disponibles
- **entrada** - Puntos de acceso a los parques
- **personal_parque** - Empleados de los parques
- **personal_de_gestion** - Personal administrativo
- **personal_de_vigilancia** - Personal de seguridad
- **personal_investigador** - Investigadores
- **personal_de_conservacion** - Personal de conservación
- **visitante** - Registro de visitantes
- **vehiculo** - Vehículos para vigilancia
- **titulacion** - Títulos académicos del personal
- **proyectos_de_investigacion** - Proyectos de investigación
- **proyecto** - Relación con proyectos
- **especie** - Especies catalogadas

## Consultas SQL

### Nivel 1 - Fundamentos (SELECT, WHERE, ORDER, LIMIT)

**1. Lista el id y nombre de las 10 primeras áreas por orden alfabético**
```sql
SELECT id, nombre
FROM parque_natural
ORDER BY nombre ASC
LIMIT 10;
```

**2. Muestra id, region y departamentos de todos los registros en departamento**
```sql
SELECT *
FROM departamento;
```

**3. Obtén los vehículos cuyo tipo sea exactamente '4x4'**
```sql
SELECT id, tipo
FROM vehiculo
WHERE tipo = '4x4';
```

**4. Trae los alojamientos con capacidad >= 4, ordenados por precio_x_noche descendente**
```sql
SELECT *
FROM alojamiento
WHERE capacidad >= 4
ORDER BY precio_x_noche DESC;
```

**5. Titulaciones obtenidas a partir de 2015-01-01**
```sql
-- No hay fechas mas allá de 2015

SELECT *
FROM parque_natural
WHERE dia_declarado >= 2010-01-01;;
```

**6. Los 5 visitantes con cedula más alta**
```sql
SELECT id, nombre, cedula
FROM visitante
ORDER BY cedula DESC
LIMIT 5;
```

**7. Todas las áreas con extension entre 15 y 25**
```sql
SELECT id, nombre, extension
FROM area2
WHERE extension BETWEEN 15 AND 25;
```

**8. Personal del parque con sueldo entre 1'800.000 y 2'200.000**
```sql
SELECT *
FROM personal_parque
WHERE sueldo BETWEEN 1800000 AND 2200000;
```

**9. Visitantes cuya profesion sea 'Ingeniero' o 'Docente'**
```sql
SELECT *
FROM visitante
WHERE profesion IN ('Ingeniero', 'Docente');
```

**10. Alojamientos ordenados por precio descendente**
```sql
SELECT id, categoria, precio_x_noche
FROM alojamiento
ORDER BY precio_x_noche DESC;
```

### Nivel 2 - Funciones y Agregación (COUNT, SUM, AVG, MIN/MAX, GROUP BY, HAVING)

**1. ¿Cuántas áreas hay en total?**
```sql
SELECT COUNT(*) AS total_parques
FROM parque_natural;
```

**2. ¿Cuántos visitantes por profesion?**
```sql
SELECT profesion, COUNT(*) AS total
FROM visitante
GROUP BY profesion;
```

**3. Promedio y máximo de precio_x_noche por categoria de alojamiento**
```sql
SELECT categoria, AVG(precio_x_noche) AS promedio_precio, MAX(precio_x_noche) AS maximo_precio
FROM alojamiento
GROUP BY categoria;
```

**4. Total de áreas por parque**
```sql
-- no hay datos superiores o iguales a 2

SELECT parque_id, COUNT(*) AS total_areas
FROM area2
GROUP BY parque_id
having count(*) >= 2
order by parque_id;
```

**5. Promedio de sueldo del personal por empleado**
```sql
SELECT id, AVG(sueldo) AS promedio_sueldo
FROM personal_parque
GROUP BY id;
```

**6. Suma de presupuesto por año en proyectos_de_investigacion**
```sql
SELECT YEAR(periodo_de_realizacion) AS anio, SUM(presupuesto) AS total_presupuesto
FROM proyectos_de_investigacion
GROUP BY YEAR(periodo_de_realizacion);
```

**7. Número de especies por tipo con al menos 10 especies**
```sql
SELECT tipo, COUNT(*) AS total_especies
FROM especie
GROUP BY tipo
HAVING COUNT(*) >= 10;
```

**8. Precio mínimo, máximo y promedio de alojamiento por parque_natural_id**
```sql
SELECT parque_natural_id, 
       MIN(precio_x_noche) AS precio_minimo, 
       MAX(precio_x_noche) AS precio_maximo, 
       AVG(precio_x_noche) AS precio_promedio
FROM alojamiento
GROUP BY parque_natural_id;
```

### Nivel 3 - JOINS (INNER, LEFT), Búsquedas Multi-tabla

**1. Listado de visitantes con su categoría de alojamiento y nombre del área**
```sql
SELECT v.nombre AS nombre_visitante,
       a.categoria AS categoria_alojamiento,
       p.nombre AS nombre_parque
FROM visitante v
JOIN alojamiento a ON v.alojamiento_id = a.id
JOIN area2 p ON a.parque_natural_id = p.id;
```

**2. Entradas con nombre y ubicación junto con el nombre del área**
```sql
SELECT e.nombre AS nombre_entrada,
       e.ubicacion,
       p.nombre AS nombre_parque
FROM entrada e
JOIN area2 p ON e.id_parque = p.id;
```

**3. Personal con nombre del área y marca del vehículo (vehículos 4x4)**
```sql
SELECT pp.nombre AS nombre_empleado,
       a.nombre AS nombre_area,
       v.marca AS marca_vehiculo
FROM personal_parque pp
JOIN area2 a ON pp.id = a.parque_id
JOIN vehiculo v ON v.tipo = '4x4';
```

**4. Especies con el nombre del área donde se ubican**
```sql
SELECT e.nombre AS nombre_especie,
       a.nombre AS nombre_parque
FROM especie e
JOIN area2 a ON e.area2_id = a.id;
```

**5. Especies con denominación científica, investigador y área**
```sql
SELECT 
    e.denominacion_cientifica AS nombre_especie,
    e.personal_investigador_id AS id_investigador,
    a.nombre AS nombre_parque
FROM especie e
JOIN area2 a ON e.area2_id = a.id;
```

**6. Entidades y departamentos (CROSS JOIN)**
```sql
SELECT en.nombre AS nombre_entidad,
       d.departamentos AS nombre_departamento
FROM entidad en
CROSS JOIN departamento d;
```

**7. Todos los títulos y fechas de titulación**
```sql
SELECT titulo, fecha
FROM titulacion;
```

## Instalación

1. Crear la base de datos:
```sql
CREATE DATABASE ambientalistas;
USE ambientalistas;
```

2. Ejecutar el script SQL proporcionado para crear las tablas e insertar los datos

## Datos de Prueba

El sistema incluye 50 registros de prueba en cada tabla para facilitar el testing y desarrollo.

## Tecnologías

- MySQL
- Engine: InnoDB
- Charset: UTF-8

## Notas

- Todas las tablas utilizan AUTO_INCREMENT para las claves primarias
- Se implementan relaciones de integridad referencial mediante FOREIGN KEYS
- Los campos ENUM restringen valores específicos para especialidades y tipos