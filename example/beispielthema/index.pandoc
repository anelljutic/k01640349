---
title: Protokolle in der Process-Schicht am Beispiel von DNS
topic: Themenbereich 2 - Computernetzwerke
videolink: https://www.youtube.com/watch?v=erpn-jhY6h4
---

Dieses Thema stellt beispielhaft ein Protokoll dar, die auf der Process-Schicht des DoD-Schichtenmodells angesiedelt sind und deren Einsatz im Internet allgegenwärtig ist. Das DNS (Domain Name System) ist ein Dienst, der ebenfalls allgegenwärtig verwendet wird, mit dem NutzerInnen aber in der Regel nicht unmittelbar interagieren. Das DNS ermöglicht die Verwendung von Domain-Namen zur Identifikation von Rechnern im Internet (etwa zu Adressierung eines Webservers in der Adresszeile eines Browsers) und trägt damit zur einfacheren Benutzbarkeit von Netzwerkdiensten bei. Sein Zweck ist analog zu jenem eines Telefonbuchs, das (Domain-)Namen (IP-Adress-)Nummern zuordnet, der Aufbau ist jedoch ungleich komplexer, da es dezentral organisiert werden muss. 

## DNS — Infrastruktur[^t2_6_3]
[Video](https://www.youtube.com/watch?v=erpn-jhY6h4&t=1265){for-image=false}

Um das DNS verteilt zu betreiben, bedarf es einer untereinander vernetzten Infrastruktur. Die daran beteiligten Komponenten und deren Zusammenarbeit werden hier beschrieben.

### Name-Server
[Video](https://www.youtube.com/watch?v=erpn-jhY6h4&t=1265){for-image=false}

Ein Nameserver ist ein Server, der Namensauflösung anbietet. Namensauflösung ist das Verfahren, das es ermöglicht, Namen von Rechnern bzw. Diensten in eine vom Computer bearbeitbare Adresse aufzulösen (z. B. www.wikipedia.org in 91.198.174.192).

Nameserver sind zum einen Programme, die auf Basis einer DNS-Datenbank Anfragen zum Domain-Namensraum beantworten, im Sprachgebrauch werden allerdings auch die Rechner, auf denen diese Programme zum Einsatz kommen, als Nameserver bezeichnet. Man unterscheidet zwischen autoritativen und nicht-autoritativen Nameservern.

Ein autoritativer Nameserver ist verantwortlich für eine Zone. Seine Informationen über diese Zone werden deshalb als gesichert angesehen. Für jede Zone existiert mindestens ein autoritativer Server, der Primary Nameserver. Dieser wird im SOA Resource Record einer Zonendatei aufgeführt. Aus Redundanz- und Lastverteilungsgründen werden autoritative Nameserver fast immer als Server-Cluster realisiert, wobei die Zonendaten identisch auf einem oder mehreren Secondary Nameservern liegen. Die Synchronisation zwischen Primary und Secondary Nameservern erfolgt per Zonentransfer.

Ein nicht-autoritativer Nameserver bezieht seine Informationen über eine Zone von anderen Nameservern sozusagen aus zweiter oder dritter Hand. Seine Informationen werden als nicht gesichert angesehen. Da sich DNS-Daten normalerweise nur sehr selten ändern, speichern nicht-autoritative Nameserver die einmal von einem Resolver angefragten Informationen im lokalen RAM ab, damit diese bei einer erneuten Anfrage schneller vorliegen. Diese Technik wird als Caching bezeichnet. Jeder dieser Einträge besitzt ein eigenes Verfallsdatum (TTL time to live), nach dessen Ablauf der Eintrag aus dem Cache gelöscht wird. Die TTL wird dabei durch einen autoritativen Nameserver für diesen Eintrag festgelegt und wird nach der Änderungswahrscheinlichkeit des Eintrages bestimmt (sich häufig ändernde DNS-Daten erhalten eine niedrige TTL). Das kann unter Umständen aber auch bedeuten, dass der Nameserver in dieser Zeit falsche Informationen liefern kann, wenn sich die Daten zwischenzeitlich geändert haben.

Ein Spezialfall ist der Caching Only Nameserver. In diesem Fall ist der Nameserver für keine Zone verantwortlich und muss alle eintreffenden Anfragen über weitere Nameserver (Forwarder) auflösen. Dafür stehen verschiedene Strategien zur Verfügung:

- Delegierung: Teile des Namensraumes einer Domain werden oft an Subdomains mit dann eigens zuständigen Nameservern ausgelagert. Ein Nameserver einer Domäne kennt die zuständigen Nameserver für diese Subdomains aus seiner Zonendatei und delegiert Anfragen zu diesem untergeordneten Namensraum an einen dieser Nameserver.

- Weiterleitung (forwarding): Falls der angefragte Namensraum außerhalb der eigenen Domäne liegt, wird die Anfrage an einen fest konfigurierten Nameserver weitergeleitet.

- Auflösung über die Root-Server: Falls kein Weiterleitungsserver konfiguriert wurde oder dieser nicht antwortet, werden die Root-Server befragt. Dazu werden in Form einer statischen Datei die Namen und IP-Adressen der Root-Server hinterlegt. Es gibt 13 Root-Server (Server A bis M). Die Root-Server beantworten ausschließlich iterative Anfragen. Sie wären sonst mit der Anzahl der Anfragen schlicht überlastet. Eine iterative Antwort enthält anstelle der Daten (z. B. IP-Adresse) einen oder mehrere Verweise auf andere Nameserver. Ein derartiger Verweis enthält den Namen des anderen Servers, den Namen der Domäne und – falls bekannt – IP-Adresse(n).

### Resolver
[Video](https://www.youtube.com/watch?v=erpn-jhY6h4&t=1337){for-image=false}

Resolver sind einfach aufgebaute Software-Module, die auf dem Rechner eines DNS-Teilnehmers installiert sind und die Informationen von Nameservern abrufen können. Sie bilden die Schnittstelle zwischen Anwendung und Nameserver. Der Resolver übernimmt die Anfrage einer Anwendung, ergänzt sie, falls notwendig, zu einem FQDN und übermittelt sie an einen normalerweise fest zugeordneten Nameserver. Ein Resolver arbeitet entweder rekursiv oder iterativ.

Im rekursiven Modus schickt der Resolver eine rekursive Anfrage an den ihm zugeordneten Nameserver. Hat dieser die gewünschte Information nicht im eigenen Datenbestand, so kontaktiert der Nameserver weitere Server, und zwar solange bis er entweder eine positive Antwort oder bis er von einem autoritativen Server eine negative Antwort erhält. Rekursiv arbeitende Resolver überlassen also die Arbeit zur vollständigen Auflösung ihrem Nameserver.

Bei einer iterativen Anfrage bekommt der Resolver entweder den gewünschten Resource Record oder einen Verweis auf weitere Nameserver, die er als Nächstes fragt. Der Resolver hangelt sich so von Nameserver zu Nameserver, bis er von einem eine verbindliche Antwort erhält.

Die so gewonnene Antwort übergibt der Resolver an das Programm, das die Daten angefordert hat, beispielsweise an den Webbrowser. Übliche Resolver von Clients arbeiten ausschließlich rekursiv, sie werden dann auch als Stub-Resolver bezeichnet. Nameserver besitzen in der Regel eigene Resolver. Diese arbeiten gewöhnlich iterativ.

### Ablauf eines DNS-Requests
[Video](https://www.youtube.com/watch?v=erpn-jhY6h4&t=1407){for-image=false}

Angenommen, ein Computer X will eine Verbindung zu „de.wikipedia.org“ (Computer Y) aufbauen. Dazu braucht er dessen IP-Adresse. In den folgenden Schritten wird beschrieben, wie dies ablaufen könnte:

1. Der Resolver des Computer X sucht in seiner Hosts-Datei, ob die IP-Adresse für „de.wikipedia.org“ dort hinterlegt ist. Falls dem nicht so ist, fragt er beim DNS-Server nach. Dieser ist entweder fest eingetragen oder wurde per DHCP automatisch zugewiesen und hat die Form nameserver 192.0.2.23.

2. Hat der DNS-Server von Computer X eine IP-Adresse für den angefragten Namen zwischengespeichert, antwortet er damit und die Anfrage kommt zum Ende (siehe letzter Punkt). Andernfalls fragt er einen der 13 Root-Nameserver nach „de.wikipedia.org“.

3. Der Root-Nameserver findet heraus, dass die Auflösung dieses Namens in der „org“-Zone weitergeht und sendet die Namen und die IP-Adressen der „org“-Nameserver (NS Resource Records und deren AAAA bzw. A Resource Records) zum DNS-Server von Computer X.

4. Nun fragt der DNS-Server von Computer X einen der Nameserver für „org.-Domains nach „de.wikipedia.org“.

5. Der „org“-Nameserver sendet ihm die Namen der Nameserver (und deren IP-Adressen, sofern sie zur selben Top-Level-Domain gehören) für die Zone „wikipedia.org.“.

6. Anschließend fragt der DNS-Server von Rechner X einen „wikipedia.org“-Nameserver wie die IP-Adresse des Namens "de.wikipedia.org" ist.

7. Mit dieser Adresse wird an den DNS-Server von Rechner X geantwortet und der …

8. … sendet sie an den Rechner X, welcher nun zum Beispiel seine HTTP-Anfragen an die IP-Adresse von „de.wikipedia.org“ senden kann.

## DNS — Aufbau und Funktion[^t2_6_4]
[Video](https://www.youtube.com/watch?v=erpn-jhY6h4&t=884){for-image=false}

Das Domain Name System (DNS) ist einer der wichtigsten Dienste in vielen IP-basierten Netzwerken. Seine Hauptaufgabe ist die Beantwortung von Anfragen zur Namensauflösung.

Das DNS funktioniert ähnlich wie eine Telefonauskunft. Der Benutzer kennt die Domain (den für Menschen merkbaren Namen eines Rechners im Internet) – zum Beispiel example.org. Diese sendet er als Anfrage in das Internet. Die URL wird dann dort vom DNS in die zugehörige IP-Adresse (die „Anschlussnummer“ im Internet) umgewandelt und führt so zum richtigen Rechner.

Das DNS ist ein weltweit auf tausenden von Servern verteilter hierarchischer Verzeichnisdienst, der den Namensraum des Internets verwaltet. Dieser Namensraum ist in so genannte Zonen unterteilt, für die jeweils unabhängige Administratoren zuständig sind. Für lokale Anforderungen – etwa innerhalb eines Firmennetzes – ist es auch möglich, ein vom Internet unabhängiges DNS zu betreiben.

Hauptsächlich wird das DNS zur Umsetzung von Domainnamen in IP-Adressen („forward lookup“) benutzt. Dies ist vergleichbar mit einem Telefonbuch, das die Namen der Teilnehmer in ihre Telefonnummer auflöst. Das DNS bietet somit eine Vereinfachung, weil Menschen sich Namen weitaus besser merken können als Zahlenkolonnen. So kann man sich einen Domainnamen wie example.org in der Regel leichter merken als die dazugehörende IP-Adresse 192.0.32.10. Dieser Punkt gewinnt im Zuge der Einführung von IPv6 noch an Bedeutung, denn dann werden einem Namen jeweils IPv4- und IPv6-Adressen zugeordnet. So löst sich beispielsweise der Name www.kame.net in die IPv4-Adresse 203.178.141.194 und die IPv6-Adresse 2001:200:0: 8002:203:47ff:fea5:3085 auf.

Ein weiterer Vorteil ist, dass IP-Adressen – etwa von Web-Servern – relativ risikolos geändert werden können. Da Internetteilnehmer nur den (unveränderten) DNS-Namen ansprechen, bleiben ihnen Änderungen der untergeordneten IP-Ebene weitestgehend verborgen. Da einem Namen auch mehrere IP-Adressen zugeordnet werden können, kann sogar eine einfache Lastverteilung per DNS (Load Balancing) realisiert werden.

DNS zeichnet sich aus durch:

- dezentrale Verwaltung,

	- hierarchische Strukturierung des Namensraums in Baumform,

	- Eindeutigkeit der Namen,

	- Erweiterbarkeit.

### Aufbau
[Video](https://www.youtube.com/watch?v=erpn-jhY6h4&t=922){for-image=false}

Der Domain-Namensraum hat eine baumförmige Struktur. Die Blätter und Knoten des Baumes werden als Labels bezeichnet. Ein kompletter Domainname eines Objektes besteht aus der Verkettung aller Labels eines Pfades.

Labels sind Zeichenketten, die jeweils mindestens ein Byte und maximal 63 Bytes lang sind. Einzelne Labels werden durch Punkte voneinander getrennt. Ein Domainname wird mit einem Punkt abgeschlossen (der letzte Punkt wird normalerweise weggelassen, gehört rein formal aber zu einem vollständigen Domainnamen dazu). Somit lautet ein korrekter, vollständiger Domainname (auch Fully Qualified Domain-Name (FQDN) genannt) zum Beispiel www.example.com. und darf inklusive aller Punkte maximal 255 Bytes lang sein.

Ein Domainname wird immer von rechts nach links delegiert und aufgelöst, das heißt je weiter rechts ein Label steht, umso höher steht es im Baum. Der Punkt am rechten Ende eines Domainnamens trennt das Label für die erste Hierarchieebene von der Wurzel (engl. root). Diese erste Ebene wird auch als Top-Level-Domain (TLD) bezeichnet. Die DNS-Objekte einer Domäne (zum Beispiel die Rechnernamen) werden als Satz von Resource Records meist in einer Zonendatei gehalten, die auf einem oder mehreren autoritativen Nameservern vorhanden ist. Anstelle von Zonendatei wird meist der etwas allgemeinere Ausdruck Zone verwendet.

![Baumstruktur des Naming im DNS](image1.png){#fig:tb2-6-1 width=100%}

[Video](https://www.youtube.com/watch?v=erpn-jhY6h4&t=934){for-image=true}

### DNS-Records
[Video](https://www.youtube.com/watch?v=erpn-jhY6h4&t=1186){for-image=false}

Das Domain Name System kann als verteilte Datenbank mit baumförmiger Struktur aufgefasst werden. Beim Internet-DNS liegen die Daten auf einer Vielzahl von weltweit verstreuten Servern, die untereinander über Verweise – in der DNS-Terminologie Delegierungen genannt – verknüpft sind.

In jedem beteiligten Nameserver existieren eine oder mehrere Dateien – die sogenannten Zonendateien – die alle relevanten Daten enthalten. Bei diesen Dateien handelt es sich um Listen von Resource Records. Von großer Bedeutung sind sieben Record-Typen:

- Mit dem SOA Resource Record werden Parameter der Zone, wie z. B. Gültigkeitsdauer oder Seriennummer, festgelegt.

	- Mit dem NS Resource Record werden die Verknüpfungen (Delegierungen) der Server untereinander realisiert.

	- Mit folgenden Record-Typen werden die eigentlichen Daten definiert:

		- Ein A Resource Record weist einem Namen eine IPv4-Adresse zu.

		- Ein AAAA Resource Record weist einem Namen eine IPv6-Adresse zu.

		- Ein CNAME Resource Record verweist von einem Namen auf einen anderen Namen.

		- Ein MX Resource Record weist einem Namen einen Mailserver zu. Er stellt eine Besonderheit dar, da er sich auf einen speziellen Dienst im Internet, nämlich die E-Mailzustellung mittels SMTP, bezieht. Alle anderen Dienste nutzen CNAME, A und AAAA Resource Records für die Namensauflösung.

Im Laufe der Zeit wurden neue Typen definiert, mit denen Erweiterungen des DNS realisiert wurden. Dieser Prozess ist noch nicht abgeschlossen.

[^t2_6_3]:	gekürzt, modifiziert und in Teilen erweitert übernommen aus [https://de.wikipedia.org/wiki/Domain\_Name\_System](https://de.wikipedia.org/wiki/Domain_Name_System) (Stand vom 1. Juni 2016)

[^t2_6_4]:	gekürzt, modifiziert und in Teilen erweitert übernommen aus [https://de.wikipedia.org/wiki/Domain\_Name\_System](https://de.wikipedia.org/wiki/Domain_Name_System) (Stand vom 1. Juni 2016)