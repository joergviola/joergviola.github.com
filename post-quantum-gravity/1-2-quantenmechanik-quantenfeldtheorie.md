---
title: "Quantenmechanik und Quantenfeldtheorie – Crashkurs"
layout: course
---

# Kapitel 1.2: Quantenmechanik und Quantenfeldtheorie – Crashkurs

## Die Schrödinger-Gleichung und Zustände

Die Quantenmechanik beschreibt die Entwicklung eines physikalischen Systems über die sogenannte Schrödinger-Gleichung:

$$
i\hbar \frac{d}{dt} \|\psi(t)\rangle = \hat{H} \|\psi(t)\rangle
$$

Hier ist \\( \\|\psi(t)\rangle \\) der Zustand des Systems zur Zeit \\( t \\), ein Vektor im Hilbertraum. Der Hamiltonoperator 
\\( \hat{H} \\) beschreibt die Energie und Dynamik des Systems.

Der zentrale Punkt ist: \\( \\|\psi(t)\rangle \\) kann eine **Superposition** vieler klassischer Möglichkeiten sein. Zum Beispiel:

$$
\|\psi\rangle = \alpha \|0\rangle + \beta \|1\rangle
$$

beschreibt ein System, das gleichzeitig in den Zuständen \\( \|0\rangle \\) und \\( \|1\rangle \\) ist – solange keine Messung erfolgt.

---

## Übergang zur Quantenfeldtheorie

In der Quantenfeldtheorie (QFT) ist der Zustand nicht mehr ein Teilchen an einem Ort, sondern ein Feld im Raum. An jedem Punkt existiert eine quantisierte Feldvariable.

Die Schrödinger-Gleichung existiert formal auch in der QFT, aber sie wirkt auf Funktionale über Feldkonfigurationen:

$$
i\hbar \frac{d}{dt} \|\Psi[\phi(x), t]\rangle = \hat{H} \|\Psi[\phi(x), t]\rangle
$$

In der Praxis ist dieser Zugang aber unhandlich. Stattdessen wird die Dynamik meist mit **Pfadintegralen** beschrieben.

---

## Feynman-Pfadintegrale

Der Feynman-Formalismus beschreibt die Wahrscheinlichkeit für einen Übergang als Summe über alle möglichen Pfade:

Der Übergang vom Schrödinger-Bild zum Pfadintegral erfolgt über eine Zerlegung des Zeitentwicklungsoperators:

$$
U(t) = e^{-i\hat{H}t/\hbar}
$$

Man unterteilt die Zeit in viele kleine Intervalle und setzt zwischen jedem Intervall eine vollständige Basis 
\\( \int dx\, |x\rangle \langle x| = 1 \\) 
ein. So entsteht eine Summe über alle möglichen Pfade durch den Konfigurationsraum. Im Limes unendlich vieler Schritte ergibt sich das Pfadintegral:

$$
\langle x_f, t_f | x_i, t_i \rangle = \int \mathcal{D}[x(t)]\, e^{\frac{i}{\hbar}S[x(t)]}
$$

Das Pfadintegral ist also nichts anderes als die kontinuierliche Version dieser zeitlich aufgelösten Entwicklung.
Dabei ist \\( S \\) die klassische Wirkung. Dieses Konzept lässt sich auf Felder verallgemeinern. Statt eine Wellenfunktion zu betrachten, summiert man über alle Feldkonfigurationen.

Warum das funktioniert? Weil es – wie die Schrödinger-Gleichung – dieselbe Unitarität und Dynamik erzeugt, aber oft rechenfreundlicher ist.

---

## Der Dichteoperator \\( \rho \\)

Der Dichteoperator beschreibt gemischte Zustände oder Zustände mit unvollständigem Wissen. Statt eines Zustandsvektors \\( \|\psi\rangle \\) verwendet man:

$$
\rho = \sum_i p_i \|\psi_i\rangle \langle \psi_i \|
$$

Auch reine Zustände lassen sich so schreiben: \\( \rho = \|\psi\rangle \langle \psi\| \\). Der Dichteoperator ist zentral, wenn man **offene Systeme** oder **Dekohärenz** beschreibt.

Oppenheim verwendet diesen Formalismus, um stochastische Kollapsprozesse mathematisch präzise zu formulieren.

---
## Wie beschreibt man eine Messung?

In der Quantenmechanik wird eine Messung durch einen Operator \\( \hat{A} \\) beschrieben – eine sogenannte Observable. Ihre Eigenwerte \\( a_i \\) sind die möglichen Messergebnisse:

$$
\hat{A} |a_i\rangle = a_i |a_i\rangle
$$

Ist das System im Zustand \\( \|\psi\rangle \\), dann ist die Wahrscheinlichkeit, das Ergebnis \\( a_i \\) zu erhalten:

$$
P(a_i) = |\langle a_i | \psi \rangle|^2
$$

Nach der Messung kollabiert der Zustand auf:

$$
|\psi\rangle \longrightarrow |a_i\rangle
$$

Diese „Projektionsregel“ ist ein zentrales Postulat der Quantenmechanik. Sie widerspricht aber der deterministischen Zeitentwicklung der Schrödinger-Gleichung.

In der Quantenfeldtheorie (QFT) ist die Situation komplexer: Hier arbeitet man mit Feldoperatoren wie \\( \hat{\phi}(x) \\).
Der Zustand ist oft ein Vielteilchenzustand im Fock-Raum. Messungen werden meist als Erwartungswerte oder Korrelationen dargestellt, z. B.:

$$
\langle \Omega | \hat{\phi}(x) \hat{\phi}(y) | \Omega \rangle
$$

Eine klare Projektionsregel gibt es in der QFT nicht, das Kollapsproblem bleibt ungelöst. Modelle wie das von Oppenheim versuchen, genau dort eine physikalische Dynamik zu etablieren.


## Kollaps und seine Bedeutung

Der Kollaps der Wellenfunktion bezeichnet das Phänomen, dass ein System nach einer Messung nicht mehr in Superposition ist, sondern in einem bestimmten Zustand.

In der Standard-QM ist das ein Postulat: Beim Messen „springt“ das System in einen Eigenzustand des Messoperators.

In der QFT wird das Konzept seltener diskutiert, da dort Felder und Teilchenentstehung dominieren – aber prinzipiell bleibt das Problem: Wie wird aus Möglichkeit Wirklichkeit?

---

## Interpretationen vor Oppenheim

Es gibt viele Deutungen der Quantenmechanik, die mit dem Kollaps unterschiedlich umgehen:

- **Kopenhagener Deutung**: Kollaps ist real, aber nur bei Messung
- **Viele-Welten-Theorie**: Kein Kollaps – alles passiert, aber in verschiedenen Welten
- **Bohmsche Mechanik**: Teilchen haben klare Bahnen, Kollaps entsteht durch verborgene Variablen
- **GRW/CSL-Modelle**: Zufällige Kollapsereignisse sind reale physikalische Prozesse

Oppenheim geht einen Schritt weiter: Er verbindet den Kollaps mit Gravitation – nicht nur konzeptionell, sondern mathematisch. Und mit der Hoffnung, dass diese Verbindung auch experimentell getestet werden kann.