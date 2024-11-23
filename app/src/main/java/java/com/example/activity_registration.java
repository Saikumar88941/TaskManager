package com.example.newtsk;

import android.content.Intent;
import android.os.Bundle;
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

public class activity_registration extends AppCompatActivity {

    FirebaseAuth mAuth;
    EditText userNameET, passwordET;
    Button  registerBTN;
    String username, password;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);

        mAuth = FirebaseAuth.getInstance();
        userNameET = findViewById(R.id.editTextUsername);
        passwordET = findViewById(R.id.editTextPassword);
        //loginBTN = findViewById(R.id.buttonLogin);
        registerBTN = findViewById(R.id.buttonRegister);

        registerBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                username = userNameET.getText().toString().trim();
                password = passwordET.getText().toString().trim();
                mAuth.createUserWithEmailAndPassword(username,password).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {
                        if(task.isSuccessful()){
                            Toast.makeText(activity_registration.this, "Registration successful!", Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(activity_registration.this, activity_login.class);
                            startActivity(intent);
                            finish(); // Close RegistrationActivity
                        } else {
                            Toast.makeText(activity_registration.this, "Please fill in all fields", Toast.LENGTH_SHORT).show();
                        }
                    }
                });
            }
        });
    }
}
