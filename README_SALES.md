# Sales Bot (Prodazha AUTO VBIV)

## Chto eto delaet
- Prodazha tarifov: `nedelya`, `mesyats`, `navsegda`.
- Oplata cherez `Crypto Pay API` (Crypto Bot).
- Posle oplaty klient otpravlyaet token svoego bota.
- Sistemа zapuskaet otdelniy instans `main.py` dlya etogo klienta.
- U kazhdogo klienta otdelnaya baza: `instances/user_<id>/bot.db`.
- Pri istechenii sroka podpiski instans avtomaticheski ostanavlivaetsya.
- Prodlenie delaetsya cherez povtornuyu pokupku tarifa.

## Chto nuzhno zamenit na svoe
V `.env` dobav i zapolni eti peremennye:

1. `SALES_BOT_TOKEN`  
Token tvoyego bota prodazh (sozday cherez BotFather).

2. `CRYPTO_PAY_TOKEN`  
API token iz `@CryptoBot` / `Crypto Pay`.

3. `SELL_PRICE_WEEK`, `SELL_PRICE_MONTH`, `SELL_PRICE_LIFETIME`  
Tvoi ceny v USDT.

4. `SALES_OWNER_IDS`  
Tvoi Telegram user id (mozhno neskolko cherez zapyatuyu).

5. (Opcionalno) `CLIENT_EXTRA_ADMIN_IDS`  
ID, kotorye budut adminami vo vseh klientskih botah.

Primer smotri v `.env.sales.example`.

## Ustanovka
1. Ustanoi zavisimosti:
```bash
pip install -r requirements.txt
```

2. Zapolni `.env`.

3. Zapusti bot prodazh:
```bash
zapusk_prodazh.bat
```

## Kak polzuetsya klient
1. Zahodit v bot prodazh.
2. Vybirayet tarif.
3. Oplachivaet invoice.
4. Nazhimaet `Proverit oplatu`.
5. Otpravlyaet token svoego bota.
6. Ego bot startuet avtomaticheski.

## Gde hranitsya
- Prodazhi/zakazy/licenzii: `sales.db`
- Tokeny klientov: v `sales.db` (v zashifrovannom vide)
- Kluch shifrovaniya: `.sales_secret.key`
- Logi klienta: `instances/user_<id>/bot_stdout.log`, `bot_stderr.log`

## Vazhno
- Ne udalyay `.sales_secret.key`, inache ne smozhesh rasшифrovat tokeny posle restarta.
- Ne vyday nikomu `CRYPTO_PAY_TOKEN`, `SALES_BOT_TOKEN`, `.env`.
