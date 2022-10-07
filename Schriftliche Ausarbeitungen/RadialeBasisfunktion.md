# Radiale Basisfunktion

Die Interpolation mittels der radialen Basisfunktionen (RBF) ist eine nicht gitterbasierte, exakte Interpolationsmethode. Das bedeutet, dass die Oberfläche durch alle Messpunkte des Geländes verlaufen muss. Ziel dieser Interpolationsmethode ist es mit den Funktionen die Oberfläche weitestgehend zu glätten. Dafür gibt es fünf verschiedene radiale Basisfunktionen mit je verschiedenen Formen, die entsprechend zu unterschiedlichen Interpolationsflächen führen.[^1]

![Die verschiedenen Funktionen, Seite 8, 7.10.2022, 15:09](https://num.math.uni-goettingen.de/picap/pdf/E562.pdf)
Alle RBFs sind Sonderformen der Splines, das heißt ein kubisches Polynom ist die Basis für die Interpolation. Splines sind stark mit den radialen Basisfunktionen verbunden. Sie sind auch nicht gitterbasiert, die Werte werden mittels mathematischen Funktonen bestimmt, die Oberfläche wird geglättet und verläuft durch die Messpunkte. Splines sind aufgrund ihrer Recheneigenschaften sehr beliebt. [^2]

Die Interpolation mittels RBFs kann man sich sich vorstellen, als würde eine Gummimatte in das vermessene Gelände gelegt. Anhaltspunkte sind hierbei die Messwerte. Die Werte dazwischen werden mittels Kreuzvalidierung bestimmt. Bei der Kreuzvalidierung wird die Genauigkeit der vorhergesagten Werte überprüft. Dazu wird die Interpolation mit Testdaten durchgeführt. Jetzt wird der zu erwartende Vorhersage-Fehler abgeschätzt. Die Beispielwerte und ihre Fehler werden nun untereinander verglichen und die Genauigkeit wird berechnet. [^3]
Ziel der Interpolation ist es neben der Berechnung von Daten zwischen den gemessenen Werten die insgesammte Oberflächenwölbung der durch die Interpolation entstehende Fläche zu minimieren.

Die RBFs bieten hier Vorteile gegenüber der globalen oder lokalen Polynomeninterpolation, da die interpolierte Fläche durch die Messpunkte verläuft und damit tatsächlich gemessene Daten enthält. Im Vergleich zu den inversen und distanzgewichteten Profilen sagen die Basisfunktionen auch Werte über bzw. unter den gemessenen Werten voraus:
![Interpolation mittels RBF, 21.9.2022, 10:37](https://desktop.arcgis.com/de/arcmap/10.4/extensions/geostatistical-analyst/GUID-8027C5DF-191E-4EF4-9BD7-AE8DA7A1BBFC-web.gif)

Vorteile ergeben sich auch durch die Gitterfreiheit der Interpolation. Gitterbasierter Interpolation liegt immer zuerst eine Triangulierung oder das Bilden eines Mosaikes zugrunde. Diese Vorarbeit entfällt hier und beschleunigt damit die Interpolation.
Ein weiterer Vorteil ist, dass RBFs den zu interpolierenden Raum abhängig machen von den gegebenen Datenpunkten. Verändern sich die Messpunkte, verändert sich auch das Gebiet, welches interpoliert werden soll, da die interpolierte Fläche ja durch die Punkte verläuft. Das ist essentiell um im multivarianten Raum zu interpolieren. [^1]
Das führt zu einer natürlicheren Oberfläche, da sie nicht bei jedem Messwert eine Spitze enthält. Hier liegt auch ein Nachteil. Liegt in dem tatsächlichen Gebiet eine Spitze wird sie in der interpolierten Fläche geglättet und ist nicht mehr sofort als solche zu erkennen. Deshalb ist die Interpolation mittels radialer Basisfunktionen nicht geeignet für starke Variationen in kurzen Abständen in der Messumgebung oder falls die gemessenen Daten (stark) fehlerbehaftet sind. In diesem Fall führt eine Interpolation mit dem Ziel die Oberfläche zu glätten natürlich dazu, dass die Werte sehr falsch sind.

Verwendet werden die RBFs zum Glätten leicht variierender Oberflächen wie beispielsweise für Geländeprofile. Außerdem verwendet man sie in der angewandten Mathematik oder in den Neurowissenschaften. [^1] Es wird angenommen, dass unser Gehirn Reize analog zur interpolation mit RBFs darstellt. Die Vermutung basiert darauf, dass Neuronenantworten in den primären sensorischen Arealen, wie die Interpolation, abstandabhängig sind [^4].
Weiterhin sind radiale Basisfunktionen

Um zu interpolieren wird über jedem Punkt, ob Messwert oder nicht, eine der fünf Basisfunktionen gebildet.
![spezieller Fall der multiquadratischen RBF, 21.9.2022, 10:36](https://pro.arcgis.com/de/pro-app/latest/help/analysis/geostatistical-analyst/GUID-55B030C7-1DF2-40FC-A2E3-7BA4B569938F-web.png)
Die Funktion ändert sich mit Abstand von einem gemessenen Punkt, da die "Funktionswerte nur vom euklidischen Abstand der Argumente abhängig sind"[^5].
Dasselbe passiert vermutlich mit den Neuronenantworten in unseren Gehirnen.

Die Vorhersage der Werte wird nun durch die gewichteten Durchschnittswerte zwischen den Werten, die die RBFs an der zu interpolierenden Stelle annehmen (siehe Grafik) gebildet. Die durch die verschiedenen Funktionen gegebenen Werte werden gemittelt und gewichtet um einen Wert für die Interpolation der Oberfläche zu erhalten.
Die Gewichtungen der Werte ergeben sich durch Verschiebung der Vorhersage an einen Punkt mit gemessenem Wert. Wird eine Vorhersage an einen Punkt mit gemessenen Werten verschoben, stimmt die RBF an dieser Stelle, da ihr ja ein Messwert als Ausgangswert der Funktion zugrunde liegt. Das führt zu einer unbekannten Menge an Gleichungen mit derselben unbekannten Menge an Unbekannten. Das entstandene Gleichungssystem kann damit eindeutig gelöst werden und sorgt für genaue Vorhersagen im gesamten Oberflächenbereich. Die Lösbarkeit und Eindeutigkeit sind stark abhängig von der Wahl der Basisfunktion und dem Parameter zur Glättung. Gegebenenfalls ereicht man nämlich stark verschiedene Ergebnisse mit den unterschiedlichen Funktionen.
Um eine möglichst ebene Oberfläche zu erhalten, enthalten alle RBFs einen Parameter der die Glätte der Oberfläche überprüft. Für diesen gilt allgemein: 'Je höher der Parameterwert, desto glatter ist die Karte'. Nur bei der inversen, multiquadratischen Basisfunktion gilt das Gegenteil. Ein niedriger Parameterwert führt hier zu einer glatteren Oberfläche.


[^1]: https://num.math.uni-goettingen.de/picap/pdf/E562.pdf 22.9.2022, 11:51

[^2]: https://desktop.arcgis.com/de/arcmap/10.7/tools/spatial-analyst-toolbox/comparing-interpolation-methods.htm#ESRI_SECTION1_44CF7274A3FE455DB9D528308BB8001D 22.9.2022, 12:21

[^3]: https://datamines.de/cross-validation/ 22.9.2022, 17:36

[^4]: https://www.spektrum.de/lexikon/neurowissenschaft/radiales-basisfunktionen-netzwerk/10668 22.9.2022, 10:03

[^5]: Zitat: https://num.math.uni-goettingen.de/picap/pdf/E562.pdf Seite 8, Zeile 4f.

Quellen:
https://desktop.arcgis.com/de/arcmap/10.4/extensions/geostatistical-analyst/how-radial-basis-functions-work.htm 27.7.2022, 17:30
Vorlesungsfolien Einführung in die Geoinformatik Nummer 5 und 6, sowie Notizen dazu
