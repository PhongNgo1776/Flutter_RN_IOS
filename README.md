# Integrating Flutter Module into React Native App

This project demonstrates how to integrate a Flutter module into a React Native application for both Android and iOS platforms.

## 📚 Reference Links

- **Android Integration Guide**  
  [Integrating Flutter Module into React Native (Android)](https://medium.com/@vidsagar/integrating-flutter-module-into-react-native-apps-33ff8359e4ab)

- **iOS Integration Guide**  
  [Integrating Flutter Module into React Native (iOS)](https://medium.com/@vidsagar/integration-of-flutter-app-as-a-component-in-react-native-ios-app-4b14ce47bfea)

---

## 🧩 Setup Instructions

### 🔧 Flutter Module (`fluttermodule`)

- I added main.dart in fluttermodule folder. You can edit it to change environment: development, staging, production.
- Update .android/app/build.gradle: 
def flutterPluginVersion = "managed"

apply plugin: "com.android.application"

android {
    namespace = "au.org.standingtall.host"
    compileSdk = 35

    compileOptions {
        coreLibraryDesugaringEnabled true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "au.org.standingtall.host"
        minSdk = 23
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
        multiDexEnabled true
    }

    buildTypes {
        profile {
            initWith debug
        }
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.debug
        }
    }

}
buildDir = new File(rootProject.projectDir, "../build/host")
dependencies {
    implementation(project(":flutter"))
    implementation(fileTree(dir: "libs", include: ["*.jar"]))
    implementation("androidx.appcompat:appcompat:1.0.2")
    implementation("androidx.constraintlayout:constraintlayout:1.1.3")
    coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:1.2.2'
}

- Update .ios/Podfile: platform :ios, '15.6' instead of platform :ios, '12'

#### Android
```bash
cd fluttermodule
cd .android
./gradlew clean build -x test
flutter build aar
```

#### iOS
```bash
cd fluttermodule/.ios
pod install
pod update
```

---

### 📱 React Native App (`rn_app`)

#### General
```bash
npm install
```

#### Android
```bash
cd android
./gradlew clean build -x test
npm run android
```

#### iOS
```bash
cd ios
pod install
pod update
npm run ios
```

---

## ✅ Notes

- Make sure both Flutter and React Native environments are correctly set up.
