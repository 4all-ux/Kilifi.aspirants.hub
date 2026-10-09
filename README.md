# Kilifi Aspirants Hub

A responsive static website for presenting aspirants by seat in Kilifi County.

## Features
- Governor, Woman Representative, Senator, MP and MCA seat navigation.
- Aspirant cards with profile/photo space, party, contact links and short bio.
- An individual editable manifesto block inside every occupied aspirant card.
- Save each manifesto in the current browser, or download it as a `.txt` file.
- Aspirant registration includes fields for a short bio and an individual manifesto.
- Footer contact buttons: **0742 048928** and **kilifi4all@gmail.com**.
- Location displayed as **Watamu, Kilifi**.

## Publish on GitHub Pages
1. Upload `index.html` to the root of your GitHub repository.
2. Commit the file.
3. Open **Settings → Pages**.
4. Choose deployment from your preferred branch and select `/(root)`, then save.

## Add permanent aspirant records
In `index.html`, find `const ASPIRANTS=[];` and add objects like this:

```js
{
  seat: "Senator",
  name: "Aspirant Name",
  party: "Party Name",
  phone: "0742048928",
  email: "aspirant@example.com",
  bio: "A short profile biography.",
  manifesto: "The aspirant's own manifesto and commitments."
}
```

Use `seat` values `Governor`, `Woman Rep`, `Senator`, `MP` or `MCA`. MP records should include `cons`; MCA records should include `cons` and `ward`.

## Important note about manifesto saving
The editor saves changes in the current browser/device and downloads a text copy. It does not automatically commit changes to GitHub or sync edits to other visitors. To publish a manifesto to everyone, copy the text into that aspirant's `manifesto` property in `const ASPIRANTS=[]` and commit/push the updated file. Shared live editing requires a backend and suitable access controls.
