pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

    plugins {
        id("dev.flutter.flutter-plugin-loader") version "1.0.0"
        id("com.android.application") version "8.1.0" apply false
        id("org.jetbrains.kotlin.android") version "2.1.0" apply false
    }
}

dependencyResolutionManagement {
    // Prefer settings repositories
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)

    // Only declare repositories here
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "flutter_test_app"
include(":app")
