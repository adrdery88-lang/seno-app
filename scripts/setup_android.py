"""Verify the Android manifest permissions for the Seno app.

The Android Gradle files are generated from the clean Flutter 3.29 template and
are committed to the repository. This script intentionally does not modify any
Gradle file (editing .gradle.kts with the old regex rules would break the build).
"""

from pathlib import Path

MANIFEST = Path("android/app/src/main/AndroidManifest.xml")

REQUIRED_PERMISSIONS = [
    "android.permission.INTERNET",
    "android.permission.RECORD_AUDIO",
    "android.permission.MODIFY_AUDIO_SETTINGS",
    "android.permission.CAMERA",
    "android.permission.ACCESS_NETWORK_STATE",
    "android.permission.WAKE_LOCK",
]


def main() -> None:
    if not MANIFEST.exists():
        raise SystemExit(f"Missing {MANIFEST}")

    content = MANIFEST.read_text(encoding="utf-8")
    missing = [
        permission
        for permission in REQUIRED_PERMISSIONS
        if f'android:name="{permission}"' not in content
    ]

    if missing:
        tags = "\n    ".join(
            f'<uses-permission android:name="{permission}" />'
            for permission in missing
        )
        content = content.replace("<application", f"    {tags}\n\n    <application", 1)
        MANIFEST.write_text(content, encoding="utf-8")
        print(f"Added manifest permissions: {', '.join(missing)}")
    else:
        print("AndroidManifest.xml permissions OK")

    print("setup_android.py completed successfully")


if __name__ == "__main__":
    main()
