---
title: "Allgemeine Relativitätstheorie – Crashkurs"
layout: course
---

# Kapitel 1.1: Allgemeine Relativitätstheorie – Crashkurs

## Was Gravitation wirklich ist

In der klassischen Physik – also vor Einstein – war Gravitation eine Kraft, die Massen anzieht, so wie es Newton beschrieben hat. Doch Einsteins Allgemeine Relativitätstheorie (ART) revolutioniert dieses Bild grundlegend: Gravitation ist keine Kraft im herkömmlichen Sinn mehr, sondern eine **Eigenschaft der Raumzeit selbst**. Genauer: Masse und Energie **krümmen** die Raumzeit, und diese Krümmung bestimmt, wie sich andere Objekte bewegen.

Teilchen folgen dabei nicht einer externen Kraft, sondern bewegen sich entlang sogenannter **Geodäten** – das sind die "geradesten möglichen Bahnen" in einer gekrümmten Geometrie. Was früher wie eine Anziehung erschien, ist in Wirklichkeit eine Folge der Krümmung von Raum und Zeit.

---

## Grundbegriffe der ART

Um die Feldgleichungen und Oppenheims Theorie zu verstehen, lohnt es sich, einige Schlüsselbegriffe der ART systematisch zu klären. Diese Begriffe tauchen auch in der modifizierten Theorie bei Oppenheim auf.

### Metrik \\( g_{\mu\nu} \\)

Die **Metrik** ist das zentrale mathematische Objekt der ART. Sie bestimmt, wie Längen und Zeiten in der Raumzeit gemessen werden.

Sie ist ein Tensorfeld, das jedem Punkt in der Raumzeit ein symmetrisches Tensorobjekt zuordnet. Aus ihr kann man alle geometrischen Größen der Raumzeit ableiten.

Die elementare Formel lautet:

$$
ds^2 = g_{\mu\nu} dx^\mu dx^\nu
$$

Hierbei ist \\( ds^2 \\) das sogenannte **Linienelement** – es gibt den Abstand zweier infinitesimal benachbarter Ereignisse an.

In der speziellen Relativität ist \\( g_{\mu\nu} = \text{diag}(-1, 1, 1, 1) \\), aber in der ART kann sich \\( g_{\mu\nu} \\) von Ort zu Ort verändern. Diese Veränderung ist es, was man als Krümmung interpretiert.

---

### Christoffel-Symbole \\( \Gamma^\rho_{\mu\nu} \\)

Diese Größen beschreiben, wie sich Koordinatensysteme in einer gekrümmten Raumzeit verändern. Sie sind notwendig, um die Ableitung von Tensorfeldern in gekrümmten Räumen zu definieren (kovariante Ableitung).

Sie werden direkt aus der Metrik berechnet:

$$
\Gamma^\rho_{\mu\nu} = \frac{1}{2} g^{\rho\lambda} \left( \partial_\mu g_{\nu\lambda} + \partial_\nu g_{\mu\lambda} - \partial_\lambda g_{\mu\nu} \right)
$$

Die Christoffel-Symbole sind keine Tensoren, aber sie sind essenziell für die Beschreibung von Geodäten und Krümmung.

---

### Riemann-Krümmungstensor \\( R^\rho_{\ \sigma\mu\nu} \\)

Der **Riemann-Tensor** misst die echte Krümmung der Raumzeit. Er gibt an, wie stark sich ein Vektor verändert, wenn man ihn entlang eines geschlossenen Weges paralleltransportiert. Wenn der Riemann-Tensor null ist, ist die Raumzeit flach.

Er wird aus den Christoffel-Symbolen gebildet:

$$
R^\rho_{\ \sigma\mu\nu} = \partial_\mu \Gamma^\rho_{\nu\sigma} - \partial_\nu \Gamma^\rho_{\mu\sigma} + \Gamma^\rho_{\mu\lambda} \Gamma^\lambda_{\nu\sigma} - \Gamma^\rho_{\nu\lambda} \Gamma^\lambda_{\mu\sigma}
$$

---

### Ricci-Tensor \\( R_{\mu\nu} \\) und Ricci-Skalar \\( R \\)

Der **Ricci-Tensor** ist eine Kontraktion des Riemann-Tensors über den ersten und dritten Index:

$$
R_{\mu\nu} = R^\lambda_{\ \mu\lambda\nu}
$$

Er beschreibt, wie sich Volumina beim Paralleltransport verändern.

Der **Ricci-Skalar** ist wiederum die Spur des Ricci-Tensors mit der Metrik:

$$
R = g^{\mu\nu} R_{\mu\nu}
$$

Diese beiden Größen sind wichtig für die dynamische Struktur der Feldgleichungen.

---

### Einstein-Tensor \\( G_{\mu\nu} \\)

Der **Einstein-Tensor** ist eine spezielle Kombination aus Ricci-Tensor und Ricci-Skalar:

$$
G_{\mu\nu} = R_{\mu\nu} - \frac{1}{2} g_{\mu\nu} R
$$

Er hat die besondere Eigenschaft, dass er **divergenzfrei** ist:

$$
\nabla^\mu G_{\mu\nu} = 0
$$

Das ist essenziell, weil es zur Energie- und Impulserhaltung passt.

---

### Energie-Impuls-Tensor \\( T_{\mu\nu} \\)

Der **Energie-Impuls-Tensor** beschreibt den physikalischen Inhalt der Raumzeit: Materie, Energie, Strahlung, Felder. Er ist ein symmetrischer Tensor, der in jedem Punkt angibt:

- wie viel Energie vorhanden ist (\\( T_{00} \\)),
- wie sich Energie und Impuls räumlich verteilen (\\( T_{0i}, T_{i0} \\)),
- wie Druck, Spannung und Flussrichtungen in einem physikalischen System wirken (\\( T_{ij} \\)).

In der klassischen Physik würde man sagen: \\( T_{\mu\nu} \\) enthält die Dichte- und Flussgrößen der Energie und des Impulses.

Er ist die Quelle der Gravitation in Einsteins Gleichung – was auch immer Raumzeit krümmen soll, muss im \\( T_{\mu\nu} \\) stehen.

---

## Die Feldgleichungen der ART

Nun sind wir bereit für die zentrale Gleichung der Allgemeinen Relativitätstheorie:

$$
R_{\mu\nu} - \frac{1}{2} g_{\mu\nu} R = \frac{8\pi G}{c^4} T_{\mu\nu}
$$

Diese Gleichung sagt: **Geometrie = Energie**.  
Die linke Seite beschreibt die Krümmung der Raumzeit – die rechte Seite beschreibt ihren physikalischen Inhalt.

Einstein selbst fasste das einmal so zusammen:

> "Materie sagt der Raumzeit, wie sie sich krümmen soll. Die Raumzeit sagt der Materie, wie sie sich bewegen soll."

---

## Bedeutung für diesen Kurs

Die Feldgleichungen der ART bilden das Fundament, auf dem auch Oppenheims Theorie aufbaut.

In seiner Sicht bleibt die Gravitation **klassisch** und geometrisch,  
bekommt aber eine neue **stochastische Rolle** in der Dynamik quantenmechanischer Zustände.

Damit diese Erweiterung verstanden werden kann, ist es wichtig, die Sprache und Struktur der ART grundlegend zu kennen – und das hast du jetzt getan.