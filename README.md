# Taller de Funciones y Procedimientos MySQL 🗄️

Un tutorial práctico paso a paso para aprender funciones personalizadas y procedimientos almacenados en MySQL. Perfecto para principiantes que quieren dominar las características avanzadas de bases de datos.

## 🚀 ¿Qué encontrarás aquí?

Este proyecto incluye ejemplos prácticos de:
- **Funciones personalizadas** - Crear tus propias funciones reutilizables
- **Procedimientos almacenados** - Automatizar operaciones complejas de base de datos
- **Operaciones CRUD** - Crear, leer, actualizar y eliminar datos
- **Vistas** - Simplificar consultas complejas
- **Relaciones entre tablas** - Trabajar con claves foráneas

## 📁 Estructura del Proyecto

```
Taller-Funciones/
├── paste.txt          # Código SQL completo con todos los ejemplos
├── README.md          # Este archivo
└── ejemplos/
    ├── funciones.sql      # Funciones básicas (Hola Mundo, impuestos, descuentos)
    ├── procedimientos.sql # CRUD de empleados
    └── vistas.sql        # Consultas con JOIN
```

## 🛠️ Tecnologías Utilizadas

- **MySQL** - Sistema de gestión de base de datos
- **SQL** - Lenguaje de consulta estructurado

## 📋 Cómo Empezar (3 pasos simples)

### 1. **Clona el repositorio**
```bash
git clone https://github.com/pabloWIB/Taller-Funciones.git
cd Taller-Funciones
```

### 2. **Abre tu cliente MySQL**
- MySQL Workbench
- phpMyAdmin
- Terminal MySQL
- O cualquier otro cliente SQL

### 3. **Ejecuta los ejemplos**
```sql
-- Copia y pega el código desde paste.txt
-- Ejecuta sección por sección para entender cada concepto
```

## ✨ Ejemplos Incluidos

### 🎯 Funciones Básicas
- `holaMundo()` - Tu primera función personalizada
- `impuestos(precio)` - Calcular precios con impuestos
- `salarioAnual(mensual)` - Convertir salario mensual a anual
- `descuento(precio, porcentaje)` - Aplicar descuentos

### 🏢 Sistema de Empleados
- Crear empleados nuevos
- Actualizar información existente
- Eliminar registros
- Consultar por departamento

### 📊 Base de Datos de Ventas
- Tablas relacionadas (clientes, productos, ventas)
- Vistas para simplificar consultas
- JOINs para combinar datos

## 🎨 Personalización Fácil

### Adapta los Ejemplos:
1. **Cambia los valores**: Modifica precios, nombres, departamentos
2. **Agrega campos**: Extiende las tablas con nuevas columnas
3. **Crea nuevas funciones**: Usa los ejemplos como plantilla
4. **Mejora la lógica**: Añade validaciones y casos especiales

### Ideas para Practicar:
- Función para calcular edad desde fecha de nacimiento
- Procedimiento para generar reportes de ventas
- Vista que muestre el top 5 de productos más vendidos

## 🌐 Opciones de Hosting/Práctica

### Para Practicar Online:
- **DB Fiddle** - Ejecuta SQL en el navegador
- **SQLiteOnline** - Prueba rápida (adapta la sintaxis)
- **MySQL Tryit Editor** - Entorno de práctica W3Schools

### Para Instalación Local:
- **XAMPP** - Incluye MySQL y phpMyAdmin
- **MySQL Community Server** - Instalación directa
- **Docker MySQL** - Para desarrolladores avanzados

## 💡 Tips para Principiantes

### 🎓 Conceptos Clave:
- **DELIMITER**: Cambia el delimitador para definir funciones/procedimientos
- **DETERMINISTIC**: Indica que la función siempre devuelve el mismo resultado
- **IN/OUT**: Parámetros de entrada y salida en procedimientos

### 📚 Recursos de Aprendizaje:
- [MySQL Documentation](https://dev.mysql.com/doc/) - Documentación oficial
- [W3Schools SQL](https://www.w3schools.com/sql/) - Tutorial básico
- [SQLBolt](https://sqlbolt.com/) - Ejercicios interactivos

### 🚀 Siguientes Pasos:
1. Practica cada función hasta entenderla completamente
2. Crea tus propias variaciones de los ejemplos
3. Experimenta con diferentes tipos de datos
4. Aprende sobre triggers y eventos
5. Explora optimización de consultas

## 🤝 Contribuir

¿Tienes ideas para mejorar los ejemplos? ¡Las contribuciones son bienvenidas!

1. Fork el proyecto
2. Crea una rama para tu función (`git checkout -b nueva-funcion`)
3. Commit tus cambios (`git commit -m 'Agregar nueva función'`)
4. Push a la rama (`git push origin nueva-funcion`)
5. Abre un Pull Request

## 📞 Soporte

Si tienes preguntas o encuentras algún error:
- Abre un [Issue](https://github.com/pabloWIB/Taller-Funciones/issues)
- Revisa la documentación de MySQL
- Prueba los ejemplos paso a paso

---

**¡Feliz aprendizaje con MySQL! 🎉** 

*Recuerda: La práctica hace al maestro. Ejecuta cada ejemplo, modifícalo y experimenta.*
