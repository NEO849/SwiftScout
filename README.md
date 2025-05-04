<table>
  <tr>   
    <td>
      <img src="Assets/ExtensionIcon.png" alt="SwiftScout Icon" width="150" />
    </td>
    <td>
      <h1 style="color: #0096FF;">SwiftScout</h1>
    </td>
  </tr>
</table>

![Swift](https://img.shields.io/badge/Swift-5.10-0096FF?logo=swift&logoColor=black)
![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0-0096FF?logo=swift&logoColor=black)
![Xcode](https://img.shields.io/badge/Xcode-15+-0096FF?logo=xcode&logoColor=black)
![macOS](https://img.shields.io/badge/macOS-12+-0096FF?logo=apple&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-0096FF?logo=open-source-initiative&logoColor=black)

**Xcode-Erweiterung für Entwickler**  
Zeigt Funktionsreferenzen direkt im Kontextmenü - modular, performant & produktionserprobt.

---

## ![Design / Screenshots](https://img.shields.io/badge/Design-%230096FF?style=for-the-badge&logo=none)

<div>
  <img src="Assets/ExtensionIcon.png" alt="Screenshot 1" width="15%" />
  <img src="Assets/ExtensionIcon.png" alt="Screenshot 2" width="15%" />
  <img src="Assets/ExtensionIcon.png" alt="Screenshot 3" width="15%" />
  <img src="Assets/ExtensionIcon.png" alt="Screenshot 4" width="15%" />
</div>

---

## ![Funktionen](https://img.shields.io/badge/Funktionen-%230096FF?style=for-the-badge&logo=none)

- **Kontextmenü-Integration** in Xcode via Rechtsklick
- **Floating Code-Panel** mit interaktiver Vorschau
- **1-Klick-Navigation** zu Referenzstellen
- **Dualer Analyse-Modus** (Mock/Live-Daten)
- **SourceKitten-Powered** für AST-basierte Code-Analyse

---

### Hauptkomponenten

| Target                | Technologie          | Beschreibung                      |
|-----------------------|----------------------|-----------------------------------|
| `SwiftScout`          | SwiftUI + AppKit     | Haupt-UI mit Panel-Steuerung      |
| `SwiftScoutExtension` | XcodeKit + SourceKit | Xcode-Integration & Code-Analyse  |

### Kernkonzepte
- **MVVM-Architektur** mit `ReferenceViewModel`
- **Modulare Services** für Code-Parsing
- **App-Gruppen** für sichere Datenkommunikation
- **Combine** für reaktive Datenströme

---

## ![Installation](https://img.shields.io/badge/Installation-%230096FF?style=for-the-badge&logo=none)

1. **Projekt klonen**
```bash
git clone https://github.com/MichaelFleps/SwiftScout.git
```

2. **Xcode-Projekt öffnen**
```bash
cd SwiftScout && open SwiftScout.xcodeproj
```

3. **Extension aktivieren**
   - Wähle Schema `SwiftScoutExtension`
   - Drücke `⌘R` zum Builden
   - In neuem Xcode: Einstellungen → Erweiterungen → **SwiftScout aktivieren**

4. **Verwendung im Projekt**
   - Rechtsklick auf Funktion → "Show References"
   - Oder Tastenkombination: `⇧⌘ + Linksklick`

---

## ![Technologie-Stack](https://img.shields.io/badge/Technologie--Stack-%230096FF?style=for-the-badge&logo=none)

| Technologie       | Einsatzbereich               |
|-------------------|------------------------------|
| Swift 5.10        | Type-Safe Kernlogik          |
| SwiftUI           | Modernes UI-Design           |
| XcodeKit          | Xcode-Erweiterungs-API       |
| SourceKitten      | AST-basierte Code-Analyse    |
| Combine           | Reaktive Datenpipeline       |
| AppKit            | Native macOS-Integration     |

--- 

## ![Lizenz](https://img.shields.io/badge/Lizenz-%230096FF?style=for-the-badge&logo=none)

- Dieses Projekt ist unter der [CC0 1.0 Universal (CC0 1.0)](https://github.com/NEO849/Sports-Almanach/tree/main#) lizenziert. Siehe die LICENSE Datei für weitere Details.

---

## ![Kontakt](https://img.shields.io/badge/Kontakt-%230096FF?style=for-the-badge&logo=none)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Michael_Fleps-0096FF?logo=linkedin)](https://www.linkedin.com/in/michael-fleps-neo849/)  
[![GitHub](https://img.shields.io/badge/GitHub-@MichaelFleps-0096FF?logo=github)](https://github.com/MichaelFleps)

---

> "Die beste Entwickler-Erfahrung entsteht,  
> wenn Tools nahtlos in den Workflow integriert sind."  
> – SwiftScout-Philosophie
