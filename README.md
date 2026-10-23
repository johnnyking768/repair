# Apex Auto Garage Auto Repair Website

A framework-free static site. Open `index.html` directly for the local demo, or deploy this folder to any static host. JPEGs in `images/` are labeled placeholders. Replace each with licensed, client-approved photography using the same filename and dimensions. See `images/IMAGES-NEEDED.md` for the image list and shot guidance.

## Rebrand

Edit `js/siteConfig.js` first. It centralizes the shop name, phone, address, business hours, BAR license, stats, certification visibility, warranty, booking endpoint, demo password, service area, services, plans, reviews, and FAQs. Update the bracketed copy in the HTML pages and replace placeholder JPEGs in `images/` using the existing filenames. Set `starCertified` to `false` when the shop is not STAR certified. Confirm every certification, warranty, offer, review, and legal statement before launch.

## Booking endpoint

Set `bookingEndpoint` in `js/siteConfig.js` to an HTTPS endpoint that accepts JSON POST requests (for example, a configured Formspree endpoint). The booking flow always saves a local copy under the `repair-requests` key; successful endpoint responses show the confirmation screen. Estimate and contact demo forms are local only and should be connected to a secure production service before launch. Never treat localStorage or the demo password as secure storage/authentication.

## Deploy

- **Netlify:** drag this folder into the Netlify deploy UI or connect its Git repository.
- **Vercel:** import the repository and select “Other”; no build command or output directory is needed.
- **GitHub Pages:** push the files to a repository and enable Pages for the chosen branch/root.

Replace `example.com` in `sitemap.xml` and `robots.txt` with the production domain. Replace placeholder AutoRepair JSON-LD values in `index.html` to match the business. Add actual, optimized image assets and check all pages on the target domain before launch.

## Demo admin

`admin.html` uses the demo-only password in `js/siteConfig.js` (`demo1234` by default). It is intentionally insecure and runs only in the current browser profile. Use a real authenticated backend for production administration.
