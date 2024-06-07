package com.db.speakify;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

public class SplashScreen extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
//                if (userId.equals("N/A")){
//                    Intent intent=new Intent(SplashScreen.this, MainActivity.class);
//                    startActivity(intent);
//                    finish();
//                }
//                else {
//                    Intent intent=new Intent(SplashScreen.this, MainActivity.class);
//                    startActivity(intent);
//                    finish();
//                }
                Intent intent=new Intent(SplashScreen.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        },3000);
    }
}