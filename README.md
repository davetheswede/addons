# Hatt

Ett litet World of Warcraft-addon som visar **”Hatt! Hatt! HATT HATT!!”** stort mitt på skärmen i 10 sekunder när du själv plockar upp ett föremål vars inventory-typ är huvudbonad (`INVTYPE_HEAD`). Andra spelares loot och föremål i andra utrustningsplatser ignoreras. Om du plockar upp en ny huvudbonad medan texten visas börjar ti sekunder om.

## Installation

1. Lägg mappen `Hatt`, med `Hatt.toc` och `Hatt.lua`, i spelets `Interface/AddOns`-mapp.
2. Starta om spelet eller ladda om gränssnittet med `/reload`.
3. Kontrollera att **Hatt** är aktiverat på addon-skärmen.

## Kompatibilitet

Addonet använder loot-chatthändelsen `CHAT_MSG_LOOT`, dess `isSelf`-flagga, itemlänkar och `GetItemInfoInstant` för att klassificera utrustningsplatsen. Dessa API:er och händelsens argument kan skilja sig mellan klientversioner. Varianten Forever är markerad som osäker och har inte verifierats mot en aktuell klient. TOC-filen anger interface-version `110200`; ändra den vid behov för din klient om spelet markerar addonet som föråldrat. Om Forever inte anger loot som `isSelf` eller inte tillhandahåller itemdata med den använda API:n kommer addonet inte att visa meddelandet.
