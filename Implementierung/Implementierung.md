# Implementierung

## Datenquelle
Als Datenquelle dient die in Matlab eingebaute Peaks-Funktion, auf die eine geneigte Ebene addiert wird. Die Peaks-Funktion "lebt" im quadratischen Bereich Ω={-3:3,-3:3}. Die Funktion wird an 100 zufällig (Gleichverteilung) ausgewählten Datenpunkten im Bereich Ω ausgewertet. Es ergibt sich eine Matrix der Form 100 x 3 mit den Datenpunkten als Zeilen und x , y und z als Spalten. Anschließend wird der Bereich Ω mit dem Eckpunkt (-3,-3) auf die Null geschoben und auf eine Größe von 50 x 50 Flächeneinheiten skaliert. Das heißt Ω deckt jetzt den Bereich {0:50,0:50} ab. Eine beispielhafte Lage der Datenpunkte (x,y) kann dem untenstehenden Plot entnommen werden.

*Bild 1: Peaks-Funktion*  
*Bild 2: Beispielhafte Lage der Datenpunkte*
