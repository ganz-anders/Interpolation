# Radiale Basisfunktion

Interpolation mittels der radialen Basisfunktionen (RBF) sind nicht gitterbasierte, exakte Interpolationsmethoden. Das bedeutet, dass die Oberfläche durch alle Messpunkte des Geländes verlaufen muss. Ziel ist es mit der Interpolation die Oberfläche weitestgehend zu glätten. Dafür gibt es fünf verschiedene Basisfunktionen mit je verschiedenen Formen, die entsprechend zu unterschiedlichen Interpolationsflächen führen. Alle RBFs sind Sonderformen der Splines.
*Bild der fünf Funktionen einfügen*,[¹]

Die Interpolation mittels RBFs kann man sich sich vorstellen, als läge man eine Gummimatte in das Gelände. Anhaltspunkte sind hierbei die Messwerte. Die Werte dazwischen werden mittels Kreuzvalidierung bestimmt. Ziel der Interpolation ist es neben der Findung von Daten zwischen den gemessenen Werten die insgesammte Oberflächenwölbung der zu interpolierenden Fläche zu minimieren.
Die RBFs bieten hier Vorteile gegenüber der globalen oder lokalen Polynomeninterpolation, da die interpolierte Fläche durch die Messpunkte geht und zu tatsächlich gemessene Daten enthält. Im Vergleich zu den inversen und distanzgewichteten Profilen sagen die Basisfunktionen auch Werte über bzw. unter den gemessenen Werten voraus: https://desktop.arcgis.com/de/arcmap/10.4/extensions/geostatistical-analyst/GUID-8027C5DF-191E-4EF4-9BD7-AE8DA7A1BBFC-web.gif 21.9.2022 10:37
Ein weiterer Vorteil ist, dass RBFs der zu interpolierenden Raum abhängig machen vn den gegebenen Datenpunkten. Das ist essentiell um in Multivarianten Raum zu interpolieren. [¹]
Das führt zu einer natürlicheren Oberfläche, da sie nicht bei jedem Messwert eine Spitze enthält. Verwendet werden die RBFs zum Glätten leicht variierender Oberflächen wie beispielsweise Geländeprofile, in den Neurowissenschaften, es wird angenommen, dass unsere Gehirne Reize analog zu RBFs darstellen[²], oder in der angewandten Mathematik. [¹]
Die Interpolation mittels radialer Basisfunktionen ist nicht geeignet für starke Variationen in kurzen Abständen in dem Realen Beispiel oder falls die gemessenen Daten fehlerbehaftet sind. In diesem Fall führt eine Interpolation mit dem Ziel die Oberfläche zu glätten natürlich dazu, dass die Werte sehr falsch sind.
Weiterhin sind radiale Basisfunktionen

Um zu interpolieren wird über jedem Punkt, ob Messwert oder nicht, eine der fünf Basisfunktionen gebildet.
https://pro.arcgis.com/de/pro-app/latest/help/analysis/geostatistical-analyst/GUID-55B030C7-1DF2-40FC-A2E3-7BA4B569938F-web.png 21.9.2022 10:36, spezieller Fall der multiquadratischen RBF
Die Funktion ändert sich mit Abstand von einem gemessenen Punkt, da die "Funktionswerte nur vom euklidischen Abstand der Argumente abhängig sind"[1]. Dasselbe passiert mit den Neuronenantworten entsprechend des Abstandes der Reize zum Zentrum des Empfängers.
Die Vorhersage der Werte wird nun durch die gewichteten Durchschnittswerte zwischen den Werten, die die RBFs an der zu interpolierenden Stelle annehmen (siehe Grafik) gebildet. Die durch die verschiedenen Funktionen gegebenen Werte werden gemittelt und gewichtet um einen Wert für die Interpolation der Oberfläche herauszubekommen.
Die Gewichtungen der Werte ergeben sich durch Verschiebung der Vorhersage an einen Punkt mit gemessenem Wert. Wird eine Vorhersage an einen Punkt mit gemessenen Werten verschoben, stimmt die RBF an dieser Stelle, da ihr ja ein Messwert als Ausgangswert der Funktion zugrunde liegt. Das führt zu einer unbekannten Menge an Gleichungen mit derselben unbekannten Menge an Unbekannten. Das entstandene Gleichungssystem kann damit eindeutig gelöst werden und sorgt für genaue Vorhersagen im gesamten Oberflächenbereich. Die Lösbarkeit und Eindeutigkeit sind stark abhängig von der Wahl der Basisfunktion und dem Parameter zur Glättung. Gegebenenfalls ereicht man nämlich stark verschiedene Ergebnisse mit den unterschiedlichen Funktionen. *###Einfügen der Bilder in der Endform####* [³]
Um eine möglichst ebene Oberfläche zu erhalten, enthalten alle RBFs einen Parameter der die Glätte der Oberfläche überprüft. Für diesen gilt allgemein: "Je höher der Parameterwert, desto glatter ist die Karte". Allein bei der inversen, multiquadratischen Basisfunktion gilt das Gegenteil. Ein niedriger Parameterwert führt hier zu einer glatteren Oberfläche.

[¹]: https://num.math.uni-goettingen.de/picap/pdf/E562.pdf 22.9.2022 11:51
[²]: https://www.spektrum.de/lexikon/neurowissenschaft/radiales-basisfunktionen-netzwerk/10668 22.9.2022 10:03
[³]: https://bildungsportal.sachsen.de/opal/g/PEEK_VIEW_WRAPPER--31697895425--99456742439238--1648006225572939012_global/Lecture_Notes_EinfGI_L6.pdf 22.9.2022 10:59, Vorlesungsfolien Geoinformatik Nummer 6 Seite 4f.

Quellen: https://desktop.arcgis.com/de/arcmap/10.4/extensions/geostatistical-analyst/how-radial-basis-functions-work.htm 27.7.2022 17:30

Zitate:
[1]: https://num.math.uni-goettingen.de/picap/pdf/E562.pdf Seite 8, Zeile 4f.
