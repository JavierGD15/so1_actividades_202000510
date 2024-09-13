#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid;
    pid = fork();

    if (pid < 0) {
        perror("Error al crear el proceso hijo");
        exit(1);
    } else if (pid == 0) {
        printf("Proceso hijo (PID: %d) se va a terminar.\n", getpid());
        exit(0);
    } else {
        printf("Proceso padre (PID: %d) ha creado un hijo (PID: %d).\n", getpid(), pid);
        sleep(60);
        printf("Revisar el estado del proceso zombie con el comando: ps -l\n");
        wait(NULL);

        printf("Proceso hijo zombie (PID: %d) ha sido eliminado.\n", pid);
    }

    return 0;
}
