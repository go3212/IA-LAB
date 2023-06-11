# Extensiones
Los programas se expanden mediante "extensiones", donde "extension0" representa la extensión base.

# Generador de Problemas

El generador de problemas está escrito en TypeScript. No lo hemos proporcionado ya compilado debido a que no conocemos las especificaciones de la máquina en la que se ejecutará. Para ejecutarlo, será necesario instalar Node.js. Recomendamos utilizar versiones superiores a la 19. 

## Instrucciones de instalación y ejecución

1. **Instalar Node.js**: Puedes descargar Node.js desde su sitio web oficial [aquí](https://nodejs.org/). Recuerda que recomendamos usar una versión superior a la 19.

2. **Instalar ts-node**: ts-node es una herramienta que nos permitirá ejecutar directamente archivos TypeScript sin tener que compilarlos a JavaScript de antemano. Puedes instalar ts-node utilizando npm (Node Package Manager), que se instala junto con Node.js. Abre una terminal en tu computadora y escribe el siguiente comando:

    ```
    npm install -g ts-node
    ```

    Esto instalará ts-node de manera global en tu sistema.

3. **Ejecutar el programa**: Para ejecutar el programa, navega hasta la carpeta 'generador' en tu terminal y luego ejecuta el siguiente comando:

    ```
    ts-node src/index.ts
    ```

    Esto ejecutará el archivo 'index.ts' dentro de la carpeta 'src' usando ts-node.

Esperamos que estas instrucciones te ayuden a ejecutar el generador de problemas de manera efectiva. Si tienes algún problema o necesitas más información, no dudes en solicitar asistencia.