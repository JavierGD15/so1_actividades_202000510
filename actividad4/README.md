# Servicio de Saludo y Fecha Actual

Este servicio imprime un saludo y la fecha actual infinitamente con una pausa de un segundo entre cada impresión.

## Instalación

1. Crear un script `saludo.sh` con el siguiente contenido:

    ```bash
    #!/bin/bash
    while true
    do
        echo "Hola, la fecha actual es: $(date)"
        sleep 1
    done
    ```

2. Darle permisos de ejecución:

    ```bash
    chmod +x saludo.sh
    ```

3. Crear un archivo de servicio para systemd en `saludo.service` con el siguiente contenido:

    ```ini
    [Unit]
    Description=Servicio que imprime un saludo y la fecha actual
    After=network.target

    [Service]
    ExecStart=saludo.sh
    Restart=always
    User=nobody

    [Install]
    WantedBy=multi-user.target
    ```

4. Habilitar e iniciar el servicio:

    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable saludo.service
    sudo systemctl start saludo.service
    ```

## Verificación de logs

Para verificar los logs del servicio en tiempo real, puedes usar el siguiente comando:

```bash
sudo journalctl -u saludo.service -f
