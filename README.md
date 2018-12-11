# Übung Communications Engineering 2018W - Phase 2

Dieses Repository dient als Basis für die Entwicklung der Inhalte, die in Phase 2 der Übung Communications Engineering im Wintersemester 2018 erstellt werden.

Die Strukturen und Inhalte, die in diesem Repository bereits enthalten sind, dienen der automatisierten Generierung von PDF- und HTML-Versionen der Inhalte und dürfen nicht verändert werden. Der Ordner "example" enthält ein Beispiel für die Aufbereitung von Inhalten mittels MarkDown.

Die Ordner, die mit Ziffern beginnen, sind für Erstellung der Inhalte vorgesehen. Jede Gruppe legt im Wesentlichen in einem dieser Ordner einen weiteren Ordner für ihr Thema an und erstellt darin ihre Inhalte.

## Vorgehen zur Einrichtung des eigenen Repositories

Zur Vorbereitung eines Repositories, in dem Sie ihre Inhalte erstellen können, gehen Sie folgendermaßen vor:

- Jedes Gruppenmitglied legt einen Account unter https://gitlab.ce.jku.at an. Der Accountname ist die 8-stellige Matrikelnummer mit führendem kleingeschriebenen "k".
- Eines der Gruppenmitglieder forkt das Repository unter https://gitlab.ce.jku.at/oppl/ue-ce-2018w-phase-2 in den eigenen Account. Klicken Sie dazu den "Fork"-Link unterhalb des Projekttitels.
- Dieses Mitglied gibt den anderen Gruppenmitgliedern Zugriffsrechte auf das geforkte Repository. Auf der Startseite des Repositories wählen Sie dazu in der linken Randspalte "Settings -> Members" und fügen die anderen User in der Rolle "Maintainer" oder "Developer" hinzu.
- Sie können nun das Repository lokal auf Ihren Rechnern auschecken. Sofern Sie keine SSH-Keys für Ihre Benutzer hinlegt haben (dies ist jeweils in den eigenen User-Settings möglich), können Sie sich über HTTPs mit ihrem Benutzernamen und Passwort authentifizieren. Den entsprechenden Git-Link finden Sie auf der Startseite des Projektes, wenn Sie unterhalb des Projekttitels von SSH aus HTTPS wechseln.

## Vorgehen zur lokalen Initialisierung des eigenen Repositories

Nachdem Sie das Repository auf den lokalen Rechner geclont haben, ist es sinnvoll einige Initialisierungs-Schritte durchzuführen, um das Repository für die Erstellung von PDF- und HTML-Versionen vorzubereiten. Nutzen Sie dazu das Terminal, wechseln Sie in den Ordner, in dem Sie das Repository geclont haben und führen Sie das folgende Kommando aus:

```bash
git submodule update --init --recursive
```

Ihr Repository enthält nun die Skripte und Templates für das Rendering von PDFs und HTML-Versionen als Submodule, die unabhängig von Ihren Inhalten aktuell gehalten werden können.

## Anlegen des eigenen Ordners und Einpflegen von existierenden Inhalten

Legen Sie nun in einem lokalen Repository den Ordner für die von Ihnen erstellten Inhalte an:

- Wählen Sie  jenen Ordner, dessen Namen mit einer Ziffer beginnt und der inhaltlich als Überbegriff zu Ihrem Thema passt. 
- Legen Sie in diesem Ordner einen neuen Ordner an, dessen Name auf Ihr Thema hinweist, aber keine Leerzeichen enthält (etwa "IP-Routing"). 
- Falls Sie auf existierenem Content aufbauen, laden Sie diesen aus dem Repository https://gitlab.ce.jku.at/oppl/learning-content und kopieren Sie ihn in diesen Ordner.
- Commiten Sie nun Ihre Änderungen am Repository und pushen Sie diese Änderungen zum GitLab-Server.
- Alle übrigen Gruppenmitglieder können nun diese Änderungen mittels einem Pull (bzw. Fetch + Merge) auf den eigenen Rechner laden.