package com.example.newtsk;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;

public class activity_login extends AppCompatActivity {

    // Firebase Authentication instance for handling login
    FirebaseAuth mAuth;

    // UI components for username, password, and buttons
    EditText userNameET, passwordET;
    Button loginBTN, registerBTN;

    // Strings to store user input
    String username, password;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        // Initialize Firebase Authentication
        mAuth = FirebaseAuth.getInstance();

        // Link UI elements to their corresponding views
        userNameET = findViewById(R.id.editTextUsername);
        passwordET = findViewById(R.id.editTextPassword);
        loginBTN = findViewById(R.id.buttonLogin);
        registerBTN = findViewById(R.id.buttonRegister);

        // Set up the Login button click listener
        loginBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Retrieve and trim the input username and password
                username = userNameET.getText().toString().trim();
                password = passwordET.getText().toString().trim();

                // Authenticate the user with Firebase
                mAuth.signInWithEmailAndPassword(username, password)
                    .addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                        @Override
                        public void onComplete(@NonNull Task<AuthResult> task) {
                            if (task.isSuccessful()) {
                                // Log success and navigate to MainActivity on successful login
                                Log.d("Login", "Login is successful");
                                Intent intent = new Intent(activity_login.this, MainActivity.class);
                                startActivity(intent);
                                finish(); // End the Login Activity
                            } else {
                                // Show an error message if login fails
                                Toast.makeText(activity_login.this, "Please enter your credentials", Toast.LENGTH_SHORT).show();
                            }
                        }
                    });
            }
        });

        // Set up the Register button click listener
        registerBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Navigate to the registration activity
                Intent intent = new Intent(activity_login.this, activity_registration.class);
                startActivity(intent);
            }
        });
    }
}
