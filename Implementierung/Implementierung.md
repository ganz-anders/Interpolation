## Implementierung

### Anmerkungen
Die Skripte sollen entsprechend ihrer Nummerierung der Reihenfolge nach ausgeführt werden. In Skript eins kann aus einer der Datenquellen gewählt und nur der jeweilige Unterabschnitt ausgeführt werden.
* *implementations1* zum Erzeugen eines Datensatzes
* *implementations2* zur Variogrammberechnung
* *implementations3* zur Berechnung der Variogrammfunktion

### Datenquelle
Als Datenquelle dient die in Matlab eingebaute Peaks-Funktion, auf die eine geneigte Ebene addiert wird. Die Peaks-Funktion "lebt" im quadratischen Bereich Ω={-3:3,-3:3}. Die Funktion wird an 100 zufällig ausgewählten Datenpunkten (Gleichverteilung) im Bereich Ω ausgewertet. Es ergibt sich eine Matrix der Form 100 x 3 mit den Datenpunkten als Zeilen und x, y und z als Spalten. Anschließend wird der Bereich Ω mit dem Eckpunkt (-3,-3) auf die Null geschoben und auf eine Größe von 50 x 50 Flächeneinheiten skaliert. Das heißt Ω deckt jetzt den Bereich {0:50,0:50} ab. Eine beispielhafte Lage der Datenpunkte (x,y) kann dem untenstehenden Plot entnommen werden. Die Messwertdaten werden in der 3 x n Matrix `data` gespeichert. Sie enthält die Spalten `x`, `y` und dem Messwert `z`.

Es wurde die Möglichkeit geschaffen, die Datenquelle und die Lage der "Messpunkte" darzustellen.



![beispielhafte Lage der Datenpunkte](Datenpunkte(2).bmp)
*Abb. 7: Peaks-Funktion und beispielhafte Lage der Datenpunkte*

Außerdem wurde die Möglichkeit geschaffen, Bilder zu laden und als Datenquelle zu verwenden. Diese können dann entweder als Graustufen-Bild oder als einzelner Farbkanal des Bildes  weiterverarbeitet werden. Anschließend werden in den Bereich des Bildes zufällige "Messpunkte" gelegt.

### Variogramm
Im zweiten Skript wird aus der Datenmatrix für jede Punktkombination der örtliche Abstand und die Varianz berechnet und in einer 2 x n Matrix `distance_variance` gespeichert. Die erste Spalte enthält den Abstand, die Zweite die quadrierte Abweichung im Messwert. Aus dieser Matrix erhält man den Plot der Variogrammwolke.

Der Bereich in dem die Abstände der Einträge der `distance_variance` Matrix liegen wird in 50 Unterintervalle aufgeteilt. Die Einträge werden in diese Intervalle kategorisiert und über jedem Intervall ein Mittelwert der Varianz berechnet. Die erhaltenen Werte werden in der 2 x n Matrix `middleVariance` gespeichert. Die erste Spalte enthält die obere Grenze des Intervalls. Die untere Grenze ist die obere des vorhergehenden bzw die null. Die obere Grenze gehört nicht zum Intervall.

Daraus lässt sich das Semivariogramm plotten. Dieses enthält die halbierte Varianz - daher semi - in Abhängigkeit des Abstands.

![Semivariogramm](Variogramm.bmp)
*Abb. 8: Semivariogrammwolke*

### Variogrammfunktion
Im dritten Skript wird versucht eine Gauss'sche oder Exponentielle Variogrammfunktion an die erhaltenen Werte anzupassen. Die Parameter sind `A` für den *range* ,`B` für das *nugget* und `C` für den *sill*. Die erhaltene Variogrammfunktion sieht für die Daten aus Quelle eins (Peaks function) in etwa folgendermaßen aus:

![angepasste gausssche Variogrammfunktion](Variogrammfunktion_beschriftet.bmp)

*Abb. 9: Gauss'sche Variogrammfunktion mit `A=47; B=0.5; C=50`*
