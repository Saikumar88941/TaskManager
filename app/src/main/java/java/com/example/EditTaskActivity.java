package com.example.newtsk;

import static com.example.newtsk.R.id.editTextTime;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.ArrayAdapter;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import java.util.Calendar;


public class EditTaskActivity extends AppCompatActivity {
    private EditText editTextTaskTitle;
    private EditText editTextTaskDescription;
    private EditText editTextDueDate;
    private EditText editTextTime;
    private Spinner spinnerPriority;
    private int taskPosition;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_task);

        // Initialize views with corrected IDs
        editTextTaskTitle = findViewById(R.id.editTextTaskTitle);
        editTextTaskDescription = findViewById(R.id.editTextTaskDescription);
        editTextDueDate = findViewById(R.id.edit_text_due_date);  // Updated ID
        editTextTime = findViewById(R.id.edit_text_time);         // Updated ID
        spinnerPriority = findViewById(R.id.spinnerPriority);
        Button buttonUpdateTask = findViewById(R.id.buttonUpdateTask);
        Button buttonDeleteTask = findViewById(R.id.buttonDeleteTask);

        // Rest of your onCreate code remains the same...

        // Set up spinner for priority
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
                this, R.array.priority_array, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinnerPriority.setAdapter(adapter);

        // Get task details from intent
        Intent intent = getIntent();
        taskPosition = intent.getIntExtra("task_position", -1);
        String taskTitle = intent.getStringExtra("task_title");
        String taskDescription = intent.getStringExtra("task_description");
        String taskDateTime = intent.getStringExtra("task_due_date");
        String taskPriority = intent.getStringExtra("task_priority");

        // Split datetime into date and time
        String[] dateTime = taskDateTime.split(" ");
        String date = dateTime[0];
        String time = dateTime.length > 1 ? dateTime[1] : "";

        // Set the task details into the EditText fields
        editTextTaskTitle.setText(taskTitle);
        editTextTaskDescription.setText(taskDescription);
        editTextDueDate.setText(date);
        editTextTime.setText(time);

        // Set spinner position based on task priority
        int spinnerPosition = adapter.getPosition(taskPriority);
        spinnerPriority.setSelection(spinnerPosition);

        // Date picker dialog
        editTextDueDate.setOnClickListener(v -> showDatePickerDialog());

        // Time picker dialog
        editTextTime.setOnClickListener(v -> showTimePickerDialog());

        // Update button click listener
        buttonUpdateTask.setOnClickListener(v -> {
            if (validateInputs()) {
                String updatedTask = createTaskString();
                Intent resultIntent = new Intent();
                resultIntent.putExtra("action", "update");
                resultIntent.putExtra("task_position", taskPosition);
                resultIntent.putExtra("updated_task", updatedTask);
                setResult(Activity.RESULT_OK, resultIntent);
                finish();
            }
        });

        // Delete button click listener
        buttonDeleteTask.setOnClickListener(v -> {
            Intent resultIntent = new Intent();
            resultIntent.putExtra("action", "delete");
            resultIntent.putExtra("task_position", taskPosition);
            setResult(Activity.RESULT_OK, resultIntent);
            finish();
        });
    }

    private void showDatePickerDialog() {
        final Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        DatePickerDialog datePickerDialog = new DatePickerDialog(this,
                (view, year1, month1, dayOfMonth) ->
                        editTextDueDate.setText(dayOfMonth + "/" + (month1 + 1) + "/" + year1),
                year, month, day);
        datePickerDialog.show();
    }

    private void showTimePickerDialog() {
        final Calendar calendar = Calendar.getInstance();
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);

        TimePickerDialog timePickerDialog = new TimePickerDialog(this,
                (view, hourOfDay, minuteOfHour) ->
                        editTextTime.setText(String.format("%02d:%02d", hourOfDay, minuteOfHour)),
                hour, minute, true);
        timePickerDialog.show();
    }

    private boolean validateInputs() {
        if (editTextTaskTitle.getText().toString().trim().isEmpty() ||
                editTextTaskDescription.getText().toString().trim().isEmpty() ||
                editTextDueDate.getText().toString().trim().isEmpty() ||
                editTextTime.getText().toString().trim().isEmpty()) {

            Toast.makeText(this, "Please fill all fields", Toast.LENGTH_SHORT).show();
            return false;
        }
        return true;
    }

    private String createTaskString() {
        String title = editTextTaskTitle.getText().toString().trim();
        String description = editTextTaskDescription.getText().toString().trim();
        String dueDate = editTextDueDate.getText().toString().trim();
        String time = editTextTime.getText().toString().trim();
        String priority = spinnerPriority.getSelectedItem().toString();

        return title + " - " + description + " - " + dueDate + " " + time + " - " + priority;
    }
}