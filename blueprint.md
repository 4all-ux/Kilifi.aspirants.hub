# Blueprint

## Site structure
- **Home:** county map, search, "Find your ward", election countdown
- **County > 7 Constituencies > 35 Wards**, each with its own page
- **Seat pages:** Governor, Woman Rep, MP, MCA
- **Aspirant profile:** photo, party, bio, manifesto, top 5 pledges, track record, events, video, contact
- **Compare tool:** up to 3 aspirants for the same seat
- **Voter info:** registration steps, polling station finder, key dates
- **Events calendar, news, FAQ**

## Key features
- Mobile-first, low-bandwidth PWA
- English and Kiswahili at launch; Giriama/Mijikenda audio in phase 2
- WhatsApp and SMS/USSD access
- M-Pesa for fees or optional volunteer contributions
- Voter Q&A answered on the record
- Ward-level pledge tracker kept as a public record after the election
- Auto-generated share cards for WhatsApp and Facebook

## Technology
| Layer | Choice |
|---|---|
| Frontend | Next.js + Tailwind (static generation) |
| CMS | Strapi or Sanity, roles: admin, moderator, aspirant |
| Database | PostgreSQL |
| Hosting | Cloudflare CDN + Kenya/Africa-region server |
| Payments | Safaricom Daraja API |
| Messaging | Africa's Talking (SMS, USSD) |
| Security | 2FA for aspirants, DDoS protection, daily backups, audit logs |
| Analytics | Plausible, per-aspirant dashboards |

## Rollout
1. Weeks 1-2: governance, terms, fee model, aspirant data collection
2. Weeks 3-6: design and build core (structure, profiles, search)
3. Weeks 7-8: pilot with a few aspirants per constituency; test on low-cost Android phones
4. Week 9: launch with a joint press event
5. Ongoing: content updates, moderation, voter Q&A, pledge tracker

## Risks
| Risk | Mitigation |
|---|---|
| Perceived bias | Neutral panel, rotation, equal templates |
| Disinformation or abuse | Moderation, reporting, appeals |
| Dropouts or late entrants | Flexible onboarding, nomination status flags |
| Low MCA participation | Ward agents who help onboard aspirants |
