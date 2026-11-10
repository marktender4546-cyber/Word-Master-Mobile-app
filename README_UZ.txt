WORD MASTER — ANDROID TARJIMONI
================================

LOYIHA NIMALARNI BAJARADI?
--------------------------
1. Matnni qo'lda kiritish.
2. Mikrofon orqali gapirib matn kiritish (Android tizimidagi Speech Recognition).
3. O'zbekcha, ruscha va inglizcha tillar orasida tarjima qilish.
4. Tarjima natijasini Android Text-to-Speech orqali ovoz chiqarib o'qish.
5. Tarjimani clipboard'ga nusxalash.
6. Tarjimani boshqa ilovalarga ulashish.
7. Tarjimalar tarixini telefonda saqlash (oxirgi 50 ta yozuv).
8. Sevimli tarjimalarni saqlash va ro'yxatni tozalash.
9. Til yo'nalishini almashtirish.

TALABLAR
--------
- Android Studio (yangi versiyasi tavsiya qilinadi)
- JDK 17 (Android Studio odatda o'zi taqdim etadi)
- Android SDK Platform 36
- Internet (Google tarjimasi uchun)
- Google Cloud loyihasi va Cloud Translation API kaliti

1-QADAM. LOYIHANI ANDROID STUDIO'DA OCHISH
-----------------------------------------
1. ZIP arxivni kompyuterga chiqaring.
2. Android Studio'ni oching.
3. File > Open ni bosing.
4. Chiqargan WordMaster papkasini tanlang (ichidagi app papkasini emas).
5. Gradle Sync tugashini kuting. Birinchi marta Gradle va Android SDK komponentlari yuklanishi mumkin.
6. Telefonni USB debugging bilan ulang yoki Android Emulator yarating.

2-QADAM. GOOGLE TRANSLATION API KALITINI OLISH
----------------------------------------------
1. https://console.cloud.google.com/ saytiga kiring va Google hisobingiz bilan tizimga kiring.
2. Yangi Google Cloud project yarating yoki mavjud loyihani tanlang.
3. Billing hisobini loyihaga ulang. Cloud Translation ishlashi uchun billing talab qilinadi.
4. APIs & Services > Library bo'limidan "Cloud Translation API" ni topib Enable qiling.
5. APIs & Services > Credentials > Create credentials > API key orqali API kalit yarating.
6. API key sozlamalarida API restrictions qo'yib, faqat Cloud Translation API'ga ruxsat bering. Quota/budget nazoratini ham yoqing.
7. Kalitni nusxalang.

Rasmiy boshlash yo'riqnomasi:
https://cloud.google.com/translate/docs/setup
Rasmiy tarjima API hujjati:
https://cloud.google.com/translate/docs/reference/rest/v2/translate

3-QADAM. API KALITINI LOYIHAGA KIRITISH
---------------------------------------
1. Android Studio loyihasining eng yuqori papkasidagi local.properties faylini oching.
   Agar u ko'rinmasa, Android Studio SDK yo'lini aniqlagach loyiha ildizida paydo bo'ladi.
2. Fayl ichidagi sdk.dir=... qatorini O'CHIRMANG.
3. Yangi qatorga quyidagini qo'shing:

   WORD_MASTER_TRANSLATE_API_KEY=AIzaSy...SIZNING_KALITINGIZ

4. Faylni saqlang va Android Studio'da Sync Project with Gradle Files ni bosing.
5. Ilovani Run qiling.

ESLATMA: local.properties Git'ga qo'shilmasligi kerak. API kalitini hech kimga yubormang.

4-QADAM. MIKROFONNI ISHLATISH
-----------------------------
1. Ilovada manba tilini O'zbekcha qilib qoldiring.
2. "Ovoz bilan yozish" tugmasini bosing.
3. Android nutq tanish oynasida o'zbekcha gapiring.
4. Tanilgan matn maydonga tushadi. So'ng "Tarjima qilish" ni bosing.

Mikrofon tugmasi Android qurilmadagi Speech Recognition xizmatidan foydalanadi.
Uning o'zbekcha (uz-UZ) tilni qo'llashi telefondagi tanish xizmatiga va til paketlariga bog'liq.
Agar o'zbekcha nutq tanilmasa:
- Google ilovasini va Speech Services komponentlarini yangilang;
- qurilmaning nutq tanish sozlamalarida o'zbekcha mavjudligini tekshiring;
- vaqtincha matnni qo'lda kiriting.

Google Cloud Speech-to-Text xizmatining rasmiy til ro'yxatida Uzbek (uz-UZ) bor:
https://cloud.google.com/speech-to-text/docs/speech-to-text-supported-languages
Lekin ushbu loyiha hozircha Cloud Speech-to-Text'ni chaqirmaydi; mikrofon Android tizimi orqali ishlaydi.

MUHIM XAVFSIZLIK OGOHLANTIRISHI
-------------------------------
Ushbu demo API kalitini BuildConfig orqali ilova APK ichiga joylaydi. local.properties kalitni
Git repozitoriyasiga tushib qolishdan saqlaydi, ammo APK ichidagi kalitni tajribali foydalanuvchi
ajratib olishi mumkin. Shuning uchun bu usul faqat shaxsiy test uchun.

Ilovani ommaga tarqatish yoki Play Store'ga chiqarishdan oldin tarjima so'rovlarini o'zingizning
backend serveringiz (masalan, Cloud Run yoki Firebase Functions) orqali yuboring. Maxfiy API
kalit serverda saqlansin; mobil ilovaga kiritilmasin. Google Cloud'da API restriction va quota
cheklovlarini ham sozlang.

XARAJATLAR HAQIDA
-----------------
Cloud Translation bepul va cheksiz xizmat emas. Billing yoqilishi kerak; narx va bepul limitlar
vaqt o'tishi bilan o'zgarishi mumkin. Ishlatishdan oldin Google Cloud'ning joriy pricing sahifasini
tekshiring va loyiha uchun budget/quota belgilang:
https://cloud.google.com/translate/pricing

MUAMMOLARNI HAL QILISH
----------------------
- "API kaliti sozlanmagan": local.properties ichidagi WORD_MASTER_TRANSLATE_API_KEY qatorini tekshiring.
- HTTP 403: API yoqilganmi, billing ulanganmi va kalit to'g'rimi tekshiring.
- HTTP 429: loyiha quota/limitiga yetgan bo'lishi mumkin.
- Ovoz tanish oynasi chiqmasa: qurilmada Speech Recognition xizmati yo'q yoki o'chirilgan bo'lishi mumkin.
- Tarjima ovozi chiqmasa: Android Text-to-Speech sozlamalaridan rus/ingliz ovoz ma'lumotlarini o'rnating.
- Birinchi Gradle Sync internet talab qiladi.

PAKET MA'LUMOTLARI
------------------
Application ID: com.wordmaster.app
Min Android: 8.0 (API 26)
Compile/Target SDK: 36
Kotlin + Android XML layout
