#!/bin/bash

# Name der screen Sitzung
SCREEN_NAME="mini"

# Pfad zu Ihrem Java-Server
SERVER_DIR="/home"

# Name der Server JAR Datei
SERVER_JAR="/home/spigot-1.21.jar"

# RAM Zuweisung für den Server (z.B. 2GB)
MIN_RAM="2G"
MAX_RAM="2G"

# Wechseln in das Serververzeichnis
cd $SERVER_DIR

# Prüfen, ob die screen Sitzung bereits läuft
if screen -list | grep -q "$SCREEN_NAME"; then
  echo "Der Server läuft bereits in einer screen Sitzung namens $SCREEN_NAME."
else
  echo "Starte den Server in einer neuen screen Sitzung namens $SCREEN_NAME..."
  # Neue screen Sitzung starten und den Server ausführen mit RAM-Zuweisung
  screen -dmS $SCREEN_NAME java -Xms$MIN_RAM -Xmx$MAX_RAM -jar $SERVER_JAR
  echo "Der Server wurde gestartet."
fi