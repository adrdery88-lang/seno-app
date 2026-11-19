package com.seno.app

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.PrintWriter
import java.io.StringWriter

class MainActivity : FlutterActivity() {
    override fun attachBaseContext(newBase: Context) {
        super.attachBaseContext(newBase)
        installCrashHandler()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CRASH_CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "takeCrashLog") {
                    result.success(takeCrashLog())
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun installCrashHandler() {
        if (handlerInstalled) return
        handlerInstalled = true
        val previous = Thread.getDefaultUncaughtExceptionHandler()
        Thread.setDefaultUncaughtExceptionHandler { thread, throwable ->
            try {
                val writer = StringWriter()
                throwable.printStackTrace(PrintWriter(writer))
                File(filesDir, "crash.txt").writeText(
                    "Thread: ${thread.name}\n${writer.toString()}"
                )
            } catch (ignored: Throwable) {
            }
            if (previous != null) {
                previous.uncaughtException(thread, throwable)
            } else {
                android.os.Process.killProcess(android.os.Process.myPid())
                kotlin.system.exitProcess(10)
            }
        }
    }

    private fun takeCrashLog(): String? {
        val file = File(filesDir, "crash.txt")
        if (!file.exists()) return null
        val text = try {
            file.readText()
        } catch (ignored: Throwable) {
            null
        }
        file.delete()
        return text
    }

    companion object {
        private const val CRASH_CHANNEL = "com.seno.app/crash"
        private var handlerInstalled = false
    }
}
