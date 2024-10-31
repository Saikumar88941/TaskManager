package com.example.taskmanager;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;



public class MainActivity extends AppCompatActivity {

    private EditText editET, editET2, editET3, editET4;
    private Button buttonBTN;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initializing EditText and Button
        editET = findViewById(R.id.editET);
        editET2 = findViewById(R.id.editET2);
        editET3 = findViewById(R.id.editET3);
        editET4 = findViewById(R.id.editET4);
        buttonBTN = findViewById(R.id.buttonBTN);

        // Setting up button click listener
        buttonBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Getting the input text from the EditTexts
                String label = editET.getText().toString();
                String date = editET2.getText().toString();
                String time = editET3.getText().toString();
                String description = editET4.getText().toString();

                // Displaying the input data as a Toast message
                String message = "Label: " + label + "\nDate: " + date + "\nTime: " + time + "\nDescription: " + description;
                Toast.makeText(MainActivity.this, message, Toast.LENGTH_LONG).show();
            }
        });
    }
}
