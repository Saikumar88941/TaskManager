package com.example.newtsk;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import java.util.Calendar;

public class AddTaskActivity extends AppCompatActivity {

    // UI components for input fields and spinner
    private EditText editTextTaskTitle, editTextTaskDescription, editTextDueDate, editTextTime;
    private Spinner spinnerPriority;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_task);

        // Initialize UI elements
        editTextTaskTitle = findViewById(R.id.editTextTaskTitle);
        editTextTaskDescription = findViewById(R.id.editTextTaskDescription);
        editTextDueDate = findViewById(R.id.editTextDueDate);
        editTextTime = findViewById(R.id.editTextTime);
        spinnerPriority = findViewById(R.id.spinnerPriority);

        // Populate the priority spinner with predefined values from the array resource
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.priority_array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerPriority.setAdapter(adapter);

        // Set up a click listener for the due date field to open the date picker dialog
        editTextDueDate.setOnClickListener(v -> showDatePickerDialog());
        // Set up a click listener for the time field to open the time picker dialog
        editTextTime.setOnClickListener(v -> showTimePickerDialog());

        // Handle the Add Task button click event
        Button buttonAddTask = findViewById(R.id.buttonAddTask);
        buttonAddTask.setOnClickListener(v -> {
            // Retrieve user input values
            String title = editTextTaskTitle.getText().toString();
            String description = editTextTaskDescription.getText().toString();
            String dueDate = editTextDueDate.getText().toString();
            String time = editTextTime.getText().toString();
            String priority = spinnerPriority.getSelectedItem().toString();

            // Validate that all fields are filled
            if (!title.isEmpty() && !description.isEmpty() && !dueDate.isEmpty() && !time.isEmpty()) {
                // Pass task details back to the calling activity as a result
                Intent resultIntent = new Intent();
                resultIntent.putExtra("new_task", title + " - " + description + " - " + dueDate + " " + time + " - " + priority);
                setResult(Activity.RESULT_OK, resultIntent);
                finish(); // Close this activity
            } else {
                // Show a message if fields are missing
                Toast.makeText(AddTaskActivity.this, "Please fill all fields", Toast.LENGTH_SHORT).show();
            }
        });
    }

    // Method to display the date picker dialog
    private void showDatePickerDialog() {
        final Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        // Open the date picker dialog and set the selected date to the due date field
        DatePickerDialog datePickerDialog = new DatePickerDialog(this,
                (view, year1, month1, dayOfMonth) -> editTextDueDate.setText(dayOfMonth + "/" + (month1 + 1) + "/" + year1),
                year, month, day);
        datePickerDialog.show();
    }

    // Method to display the time picker dialog
    private void showTimePickerDialog() {
        final Calendar calendar = Calendar.getInstance();
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);

        // Open the time picker dialog and set the selected time to the time field
        TimePickerDialog timePickerDialog = new TimePickerDialog(this,
                (view, hourOfDay, minuteOfHour) -> editTextTime.setText(String.format("%02d:%02d", hourOfDay, minuteOfHour)),
                hour, minute, true); // The last parameter specifies 24-hour format
        timePickerDialog.show();
    }
}

