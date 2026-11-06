# AutoTube AI — Personal Beta Starter

এটি AutoTube AI-এর প্রথম Android UI prototype, production-ready automation নয়।

## এই সংস্করণে যা আছে
- বাংলা Dark-mode mobile dashboard
- Channel, Schedule এবং Settings navigation
- Automation pipeline-এর প্রাথমিক UI

## এখনো যা যুক্ত হয়নি
- Google/YouTube OAuth এবং Channel connection
- AI script generation
- AI voice/video generation ও rendering
- SEO research ও thumbnail generation
- Cloud scheduler, automatic upload ও analytics sync

## চালাতে যা লাগবে
1. একটি কম্পিউটারে Flutter SDK এবং Android Studio ইনস্টল করতে হবে।
2. এই project folder খুলে terminal-এ চালাও:
   ```bash
   flutter pub get
   flutter run
   ```
3. Android APK বানাতে:
   ```bash
   flutter build apk --release
   ```
   APK পাওয়া যাবে `build/app/outputs/flutter-apk/app-release.apk`-এ।

## Production architecture (পরবর্তী ধাপ)
- Android app: Flutter
- Backend API: secure server (FastAPI/Node)
- Database: PostgreSQL
- Job queue + scheduler: Redis + worker
- Media storage: private object storage
- YouTube integration: Google OAuth 2.0 + YouTube Data API
- AI providers: script, voice, image/video generation services

## Security requirements
- Google password কখনো সংগ্রহ করবে না; OAuth consent flow ব্যবহার করবে।
- OAuth refresh token শুধু encrypted server-side storage-এ রাখতে হবে।
- API keys কখনো Android app-এর source code-এ রাখা যাবে না।
- Upload-এর আগে channel owner-এর স্পষ্ট opt-in এবং emergency stop রাখতে হবে।
- YouTube API quota, upload restrictions, copyright, privacy ও monetization policies মানতে হবে।
- AI services-এর খরচ ও দৈনিক usage limit configure করতে হবে।

## Important
প্রথমে একটি test channel বা private/unlisted test upload দিয়ে পরীক্ষা করো। Public auto-publishing চালুর আগে সব automation, rights checks এবং failure handling যাচাই করা প্রয়োজন।

## Build using only an Android phone
You can edit and build this project from a phone using a browser and a GitHub account:
1. Create a new GitHub repository.
2. Upload the project files (including `.github/workflows/android.yml`) to the repository's `main` branch.
3. Open the repository's **Actions** tab and run **Build AutoTube AI Android APK** (or wait for the first push build).
4. Open the successful workflow run, find **Artifacts**, and download `autotube-ai-android-apk`.
5. Extract the downloaded artifact and install the APK on your Android phone.

This workflow builds the current UI prototype only. It does not add the real AI services, YouTube OAuth, cloud backend, or automatic publishing.
