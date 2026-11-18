import os
import re

print("Running setup_android.py...")

# 1. Update AndroidManifest.xml
manifest_path = os.path.join("android", "app", "src", "main", "AndroidManifest.xml")
if os.path.exists(manifest_path):
    with open(manifest_path, "r", encoding="utf-8") as f:
        content = f.read()

    permissions = """
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
"""
    if "android.permission.RECORD_AUDIO" not in content:
        content = content.replace("<application", permissions + "\n    <application")
        with open(manifest_path, "w", encoding="utf-8") as f:
            f.write(content)
        print("Updated AndroidManifest.xml with permissions.")
else:
    print(f"Warning: {manifest_path} not found.")

# 2. Update android/app/build.gradle for Android 7+ (minSdkVersion = 21)
gradle_path = os.path.join("android", "app", "build.gradle")
if os.path.exists(gradle_path):
    with open(gradle_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Replace minSdkVersion flutter.minSdkVersion or minSdkVersion = ... with 21
    content = re.sub(r"minSdkVersion\s*=.*", "minSdkVersion = 21", content)
    content = re.sub(r"minSdkVersion\s+flutter\.minSdkVersion", "minSdkVersion 21", content)
    
    with open(gradle_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("Updated android/app/build.gradle minSdkVersion to 21 (Android 7+ support).")
else:
    print(f"Warning: {gradle_path} not found.")

print("setup_android.py completed successfully!")
