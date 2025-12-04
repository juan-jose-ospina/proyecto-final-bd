# Sistema de Gestión de Proyectos - Base de Datos

## 📋 Descripción del Proyecto

Sistema de base de datos relacional diseñado para gestionar proyectos, clientes, colaboradores y pagos de una empresa de desarrollo de software. Este proyecto fue desarrollado como trabajo final del curso de Base de Datos en la Universidad Tecnológica de Pereira.

## 👥 Autores

- Juan José Ospina Ospina
- Mateo Cifuentes
- Santiago Quintero

**Docente:** Juliana Franco Villegas  
**Programa:** Tecnología en Desarrollo de Software  
**Institución:** Universidad Tecnológica de Pereira  
**Fecha:** diciembre 3, 2025

## 🎯 Problemática

La empresa enfrentaba los siguientes desafíos:

- 📁 Datos dispersos en múltiples archivos
- ❌ Imposible rastrear asignaciones de colaboradores
- 💰 Sin control de pagos realizados
- 📊 Generación de reportes tardaba horas o días
- ⚠️ Alto riesgo de errores costosos
- 🔍 Horas perdidas buscando información

## ✅ Solución Implementada

- ✓ Centralización de información
- ✓ Integridad de datos garantizada
- ✓ Trazabilidad completa de operaciones
- ✓ Consultas rápidas y eficientes
- ✓ Reportes automáticos
- ✓ Control total de operaciones

## 🗂️ Estructura de la Base de Datos

### Tablas Principales

1. **Cliente**: Información de clientes
   - id_cliente (PK)
   - nombre, telefono, direccion, email

2. **Proyecto**: Proyectos de la empresa
   - codigo (PK)
   - nombre, fecha_inicio, fecha_fin, presupuesto
   - id_cliente (FK)

3. **Colaborador**: Empleados/colaboradores
   - NIF (PK)
   - nombre, telefono, email, direccion, cuenta
   - codigo_banco (FK)

4. **Banco**: Entidades bancarias
   - codigo_banco (PK)
   - nombre

5. **Participa**: Relación Proyecto-Colaborador
   - codigo (FK), NIF (FK)
   - Tabla intermedia

6. **Tipo_pago**: Tipos de pago disponibles
   - id_tipo (PK)
   - descripcion

7. **Pago**: Registro de pagos
   - id_pago (PK)
   - fecha, monto
   - NIF (FK), id_tipo (FK)

## 📐 Normalización

El diseño cumple con las tres primeras formas normales:

### 1NF (Primera Forma Normal)
- ✅ Todos los atributos son atómicos
- ✅ Sin grupos repetitivos
- ✅ Cada tabla tiene clave primaria

### 2NF (Segunda Forma Normal)
- ✅ Cumple 1NF
- ✅ Sin dependencias parciales

### 3NF (Tercera Forma Normal)
- ✅ Cumple 2NF
- ✅ Sin dependencias transitivas
- 🔧 **Corrección aplicada**: Se extrajo la entidad `Banco` de `Colaborador` para eliminar la dependencia transitiva NIF → cuenta → banco

## 💻 Consultas SQL Implementadas

### Consultas SELECT

1. **Ver proyectos con clientes y colaboradores**
   - JOIN entre Proyecto, Cliente, Participa y Colaborador

2. **Contar proyectos por cliente**
   - GROUP BY con COUNT

3. **Total y promedio pagado por colaborador**
   - SUM y AVG con GROUP BY

4. **Ver pagos con detalles**
   - JOIN entre Pago, Colaborador y Tipo_pago

5. **Calcular comisión del 10% sobre proyectos**
   - Operaciones matemáticas en SELECT

6. **Colaboradores por banco**
   - COUNT con GROUP BY

### Operaciones DML

- **INSERT**: Agregar nuevos pagos
- **UPDATE**: Actualizar teléfonos y presupuestos
- **DELETE**: Eliminar registros

## 📊 Modelo Entidad-Relación

El proyecto incluye:
- Diagrama E-R Extendido
- Modelo Relacional
- Diccionario de datos completo

## 🛠️ Tecnologías Utilizadas

- **SGBD**: MySQL
- **Diseño**: Modelado E-R
- **Lenguaje**: SQL (DDL, DML)

## 📝 Documentación

El proyecto incluye:
- Diccionario de datos detallado
- Análisis de normalización paso a paso
- Ejemplos de consultas SQL
- Diagramas E-R y relacionales


## 📄 Licencia

Este proyecto fue desarrollado con fines educativos para la Universidad Tecnológica de Pereira.

---

**Universidad Tecnológica de Pereira**  
Tecnología en Desarrollo de Software  
2025
