## Next Generation Certificate Manager

Der `ng-certificate-manager` beantragt, verwaltet und verteilt Zertifikate,
z.B. von Let's Encrypt an Hosts und Dienste, welche diese benötigen.

Im Falle von DNS-Validierung ermöglicht es, die dafür notwendigen Zugangsdaten
nur auf einem Server zu hinterlegen, welcher dann die ausgestellten Zertifikate weiterverteilt.

Auch in anderen Fällen kann die zentralisierte Verwaltung und Beantragung nützlich sein.
Dadurch muss nicht mehr auf jedem Host, der ein Zertifikat braucht, certbot konfiguriert werden,
sondern nur noch ein simples Deployment-Skript ("plugin") auf dem Server, der den
`ng-certificate-manager` ausführt hinzugefügt werden.

### Getting Started:
1. Kopiere die Datei `config.example.yml` nach `config.yml`
2. Befülle die Datei entsprechend der Kommentare
3. Führe das Skript manuell aus, um die Konfiguration zu testen
4. Erstelle ein Deployment-Skript/Plugin, um das Zertifikat zu verteilen
5. Füge das Skript in die Crontab ein, oder erstelle eine SystemD Timer Unit. 
   Es ist not nötig, das Skript öfter als täglich aufzurufen.

### Funktionsweise:
Der `ng-certificate-manager` führt nach der erfolgten Ausstellung/Verlängerung
alle **ausführbaren** (execute-Recht) Dateien/Programme im Ordner `cert-plugins`
in alphabetischer Reihenfolge aus.

***Hinweis:** Alle ausführbaren Textdateien (alle Skripte, z.B. Python, Bash usw.)
müssen eine valide Shebang haben. Ansonsten weiß das System nicht, mit welchem
Interpreter das Skript ausgeführt werden muss (siehe https://realguess.net/2013/11/17/why-shebang/).*

Beispiele für Deployment-Skripte bzw. Plugins befinden sich in `example-cert-plugins`.