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
4. [Erstelle ein Deployment-Skript/Plugin, um das Zertifikat zu verteilen](#eigene-pluginsdeployment-skripte)
5. Füge das Skript in die Crontab ein, oder erstelle eine SystemD Timer Unit.
   Es ist not nötig, das Skript öfter als täglich aufzurufen.

### Funktionsweise:

Der `ng-certificate-manager` führt nach der erfolgten Ausstellung/Verlängerung
alle **in der Konfig festgelegten** Dateien/Programme im Ordner `cert-plugins` in konfigurierter Reihenfolge aus.

***Hinweis:** Alle ausführbaren Textdateien (alle Skripte, z.B. Python, Bash usw.)
**müssen** eine valide Shebang haben. Ansonsten weiß das System nicht, mit welchem
Interpreter das Skript ausgeführt werden muss (siehe https://realguess.net/2013/11/17/why-shebang/).*

### Eigene Plugins/Deployment-Skripte:

Erstelle eine ausführbare Datei, z.B. ein Bash-Skript im Ordner `cert-plugins`.
Diesem Plugin stehen folgende Informationen (sowohl als Paramter als auch als Umgebungsvariable) zur Verfügung:

| Parameter Nr. | Umgebungsvariable                     | Beschreibung                                                                                                                                                        |
|---------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1             | `_CERT_NAME`                          | Der Name des Zertifikats (`certificate_name` in der `config.yml`)                                                                                                   |
| 2             | `_CERT_FULLCHAIN`<br/>~~`_FULLCERT`~~ | Der Pfad zur `fullchain.pem`, dem Zertifikat incl. der Zertifikatshierarchie.<br/>Der veraltete Name `_FULLCERT` wird aus Kompatibilitätsgründen weiterhin gesetzt. |
| 3             | `_CERT_KEY`<br/>~~`_KEY`~~            | Der Pfad zur `privkey.pem`, dem privaten Schlüssel zum Zertifikat.<br/>Der veraltete Name `_KEY` wird aus Kompatibilitätsgründen weiterhin gesetzt.                 |

Beispiele für Deployment-Skripte bzw. Plugins befinden sich in `example-cert-plugins`.
