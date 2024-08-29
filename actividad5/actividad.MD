# Conceptos de Sistemas Operativos

## 1. Tipos de Kernel y Sus Diferencias

### Kernel Monolítico
- **Descripción**: En un kernel monolítico, todos los servicios básicos del sistema operativo (como la gestión de procesos, gestión de memoria, gestión del sistema de archivos, etc.) se ejecutan en el mismo espacio de direcciones en modo kernel. Este enfoque puede ofrecer un alto rendimiento debido a interacciones directas, pero puede ser menos seguro y más difícil de mantener.
- **Ejemplos**: Linux, Unix.

### Microkernel
- **Descripción**: Un microkernel ejecuta las funciones más básicas, como la comunicación entre procesos y la planificación básica en modo kernel, mientras que otros servicios como los controladores de dispositivos, sistemas de archivos y protocolos de red se ejecutan en el espacio de usuario. Este diseño mejora la seguridad y estabilidad, pero puede introducir sobrecarga de rendimiento debido al aumento del cambio de contexto.
- **Ejemplos**: Minix, QNX.

### Kernel Híbrido
- **Descripción**: Los kernels híbridos combinan aspectos de los kernels monolíticos y microkernels. Ejecutan algunos servicios en modo kernel (como los kernels monolíticos) pero usan módulos o servidores en el espacio de usuario para otros servicios (como los microkernels). Esto busca equilibrar rendimiento y modularidad.
- **Ejemplos**: Windows NT, macOS (XNU).

### Exokernel
- **Descripción**: Los exokernels proporcionan abstracciones mínimas y asignan recursos directamente a las aplicaciones, permitiendo más personalización y potencialmente mayor rendimiento. La complejidad se transfiere al nivel de la aplicación.
- **Ejemplos**: MIT Exokernel.

## 2. Modo Usuario vs. Modo Kernel

- **Modo Usuario**: 
  - La CPU opera con permisos restringidos, limitando el acceso al hardware y a los recursos críticos del sistema. Las aplicaciones se ejecutan en este modo para asegurar que cualquier error o fallo no afecte a todo el sistema.
  - **Ejemplos**: Ejecución de un procesador de texto, navegador web, etc.
  
- **Modo Kernel**: 
  - La CPU tiene acceso completo a todo el hardware y recursos del sistema. Los componentes principales del sistema operativo (como el kernel) se ejecutan en este modo, gestionando el hardware, la memoria y otras tareas críticas.
  - **Ejemplos**: Manejo de llamadas al sistema, gestión de procesos, gestión de memoria.

### Diferencias:
- **Nivel de Acceso**: El modo usuario tiene acceso limitado al hardware, mientras que el modo kernel tiene acceso sin restricciones.
- **Seguridad**: Las fallas en modo usuario típicamente no afectan a todo el sistema, pero las fallas en modo kernel pueden llevar a fallos a nivel del sistema.
- **Rendimiento**: Las operaciones en modo kernel son más rápidas debido al acceso directo al hardware, pero también son más riesgosas.

## 3. Interrupciones vs. Traps

### Interrupciones
- **Definición**: Las interrupciones son señales enviadas por el hardware o el software a la CPU, indicando que un evento necesita atención inmediata. Pueden ocurrir de forma asíncrona y pueden provenir de dispositivos externos (como teclados o tarjetas de red).
- **Ejemplos**: Interrupciones de temporizador, interrupciones de entrada/salida.
- **Propósito**: Manejar eventos en tiempo real que necesitan procesamiento inmediato, como un paquete de red entrante.

### Traps
- **Definición**: Los traps son un tipo de interrupción síncrona generada por la propia CPU cuando ocurre una excepción o cuando un programa realiza una llamada al sistema. Son intencionales y predecibles.
- **Ejemplos**: División por cero, acceso a memoria no válido, llamadas al sistema.
- **Propósito**: Manejar excepciones o solicitar un servicio del sistema operativo.

### Diferencias:
- **Fuente**: Las interrupciones suelen ser basadas en hardware y asíncronas, mientras que los traps son basados en software y síncronos.
- **Propósito**: Las interrupciones manejan eventos externos, mientras que los traps manejan condiciones excepcionales o solicitudes de servicio del sistema.
- **Temporalidad**: Las interrupciones pueden ocurrir en cualquier momento, pero los traps ocurren en respuesta directa a la ejecución de un programa.
