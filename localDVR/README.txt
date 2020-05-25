0. Descargue e instale el programa VLC
1. Abrir el archivo config.ini con notepad
2. Configurar las variables según su necesidad en config.ini

Los valores que necesita configurar son:

Duración de cada archivo de video creado en segundos
    record_time=30

Máximo número de archivos creados (borra los primeros para guardar los últimos)
max_records=48

Letra del disco y carpeta donde se grabarán los archivos:
    rootLetter=D:
    folder=DVR

Ubicación del VLC (por defecto)
    vlcPath=C:\Program Files (x86)\VideoLAN\VLC

Ubicación horaria
    timezone=GTM-5

Nombres de las cámaras
    cam1_name=testCam1

Enlaces rtsp desde donde se capturará la grabación
    cam1_URL=rtsp://admin:admin@192.168.1.68/ch0_0.h264

Parámetros adicionales del VLC (para evitar creación de íconos en la bandeja de notificaciones de windows)
    vlc_params=--no-qt-system-tray 
