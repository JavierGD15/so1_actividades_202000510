# Actividad 6 – Procesos e Hilos

## Pregunta 1
**¿Incluyendo el proceso inicial, cuántos procesos son creados por el siguiente programa? Razone su respuesta.**

### Código proporcionado:
```c
#include <stdio.h>
#include <unistd.h>

int main() {
    /* fork a child process */
    fork();

    /* fork another child process */
    fork();

    /* and fork another */
    fork();

    return 0;
}
```

## Análisis:

El programa dado utiliza la función `fork()` para crear procesos hijos. La función `fork()` duplica el proceso que la llama, resultando en un proceso hijo adicional por cada llamada. Vamos a analizar cuántos procesos se crean en total con cada llamada a `fork()`.

### Primera llamada a `fork()`:
- Crea un proceso hijo.
- Total de procesos ahora: 2 (1 padre, 1 hijo).

### Segunda llamada a `fork()`:
- Se ejecuta en ambos procesos existentes (padre e hijo), duplicando el número de procesos.
- Total de procesos ahora: 4 (2 padres, 2 hijos).

### Tercera llamada a `fork()`:
- Se ejecuta en todos los 4 procesos existentes, duplicando nuevamente el número de procesos.
- Total de procesos ahora: 8 (4 "padres", 4 "hijos").

### Conclusión:
Incluyendo el proceso inicial, el programa crea un total de **8 procesos**. La razón de esto es que cada llamada a `fork()` duplica el número de procesos en ejecución, partiendo del proceso original y afectando a todos los procesos que han sido creados hasta el momento de cada nueva llamada a `fork()`.


## Pregunta 2
**Usando el código como referencia, completar el programa para que sea ejecutable y responder las siguientes preguntas:**

- **¿Cuántos procesos únicos son creados?**
- **¿Cuántos hilos únicos son creados?**

### Código completado:
```c
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void* thread_function(void* arg) {
    printf("Thread created\n");
    return NULL;
}

int main() {
    pid_t pid;
    pthread_t thread;

    pid = fork();
    if (pid == 0) {  // Proceso hijo
        fork();  // Crea otro proceso hijo desde este proceso
        pthread_create(&thread, NULL, thread_function, NULL);  // Crea un hilo
        pthread_join(thread, NULL);  // Espera a que el hilo termine
    }
    
    fork();  // Esta llamada se ejecuta tanto en el proceso padre como en el hijo

    return 0;
}
```

### Análisis:

#### Primera llamada a `fork()`:
- Crea un proceso hijo a partir del proceso padre.
- Total de procesos ahora: 2 (padre, hijo).

#### Dentro del proceso hijo:
- Se ejecuta otro `fork()`, que crea un nuevo proceso hijo desde el proceso hijo anterior.
- Total de procesos ahora: 3 (padre, hijo, nuevo hijo del hijo).

#### Creación del hilo:
- Solo el proceso hijo crea un hilo.
- Este hilo es único y no se propaga entre procesos.
- Total de hilos creados: 1.

#### Segunda llamada a `fork()` (fuera del `if`):
- Se ejecuta en los tres procesos existentes (padre, primer hijo, y segundo hijo), creando un proceso nuevo por cada uno de ellos.
- Total de procesos ahora: 6 (cada uno de los 3 procesos crea otro).

### Respuesta:

- **¿Cuántos procesos únicos son creados?**
  - Se crean **6 procesos** únicos en total:
    - 1 proceso padre original.
    - 1 proceso hijo a partir de la primera llamada a `fork()`.
    - 1 proceso hijo a partir del proceso hijo original (segunda llamada a `fork()` dentro del `if`).
    - 3 nuevos procesos debido a la segunda llamada a `fork()` (uno por cada proceso existente).

- **¿Cuántos hilos únicos son creados?**
  - Solo se crea **1 hilo** único, ya que el hilo solo se crea en el proceso hijo original.
