//package com.example.talksy_app
//
//import io.flutter.embedding.android.FlutterActivity
//
//class MainActivity: FlutterActivity()
package com.example.talksy_app
import android.widget.Toast
import android.util.Log

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {


    override fun onDestroy() {
        super.onDestroy()
        println("Hello World")
    }
}
