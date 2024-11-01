package com.example.taskmanager;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private EditText editLabel, editDate, editTime, editDescription;
    private Button confirmButton;

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

        // Initialize Button
        confirmButton = findViewById(R.id.buttonBTN);

        // Set click listener for confirm button
        confirmButton.setOnClickListener(v -> {
            String label = editLabel.getText().toString();
            String date = editDate.getText().toString();
            String time = editTime.getText().toString();
            String description = editDescription.getText().toString();

            if (!label.isEmpty() && !date.isEmpty() && !time.isEmpty() && !description.isEmpty()) {
                // Show a success message
                Toast.makeText(MainActivity.this, "Task Confirmed", Toast.LENGTH_SHORT).show();
            } else {
                // Show an error if any field is empty
                Toast.makeText(MainActivity.this, "Please fill in all fields", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
