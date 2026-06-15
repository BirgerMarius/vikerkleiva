# Vikerkleiva foto

En enkel fotonettside bygget med ren HTML, CSS og JavaScript. Nettsiden er
laget for publisering med GitHub Pages.

## Sider

- Forside: `index.html`
- Galleri: `galleri/index.html`
- Om: `om/index.html`
- Kontakt: `kontakt/index.html`

## Legge til bilder

1. Legg det komprimerte bildet i riktig mappe under `bilder`.
2. Åpne HTML-filen der bildet skal vises.
3. Erstatt en plassholder med et bildeelement:

```html
<img
  src="../bilder/galleri/filnavn.webp"
  alt="Kort beskrivelse av motivet"
  loading="lazy"
>
```

Bildet øverst på siden bør ikke ha `loading="lazy"`.

## Anbefalt bildeformat

- Bruk WebP eller komprimert JPEG.
- Bruk små bokstaver og bindestrek i filnavn, for eksempel
  `solnedgang-over-viker.webp`.
- En bredde på omtrent 1600-2400 piksler er vanligvis nok på en nettside.
- Prøv å holde hvert bilde under 500 KB når det er mulig.

## Publisere med GitHub Pages

1. Lagre og test endringene lokalt.
2. Commit og push endringene med GitHub Desktop.
3. Åpne repository-innstillingene på GitHub.
4. Velg **Pages** under **Settings**.
5. Velg publisering fra branch, deretter `master` og mappen `/ (root)`.
6. Lagre og vent til GitHub viser adressen til nettsiden.

Et eget domene kan kobles til senere uten å endre nettsidens oppbygning.
