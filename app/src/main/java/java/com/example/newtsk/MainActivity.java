package com.example.newtsk;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    private ListView listViewTasks;
    private ArrayList<String> tasks;
    private ArrayAdapter<String> adapter;
    private static final int ADD_TASK_REQUEST = 1;
    private static final int EDIT_TASK_REQUEST = 2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listViewTasks = findViewById(R.id.listViewTasks);
        Button buttonAddTask = findViewById(R.id.buttonAddTask);
        Button buttonSettings = findViewById(R.id.buttonSettings);
        Button buttonCategories = findViewById(R.id.buttonCategories);
        Button buttonBackToLogin = findViewById(R.id.buttonBackToLogin);
        Button buttonHistory = findViewById(R.id.buttonHistory);

        tasks = new ArrayList<>();
        adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, tasks);
        listViewTasks.setAdapter(adapter);

        buttonAddTask.setOnClickListener(v -> {
            Intent intent = new Intent(MainActivity.this, AddTaskActivity.class);
            startActivityForResult(intent, ADD_TASK_REQUEST);
        });

        buttonHistory.setOnClickListener(v -> {
            Intent intent = new Intent(MainActivity.this, activity_history.class);
            intent.putStringArrayListExtra("task_history", tasks);
            startActivity(intent);
        });

        buttonSettings.setOnClickListener(v -> {
            Intent intent = new Intent(MainActivity.this, SettingsActivity.class);
            startActivity(intent);
        });

        buttonCategories.setOnClickListener(v -> {
            Intent intent = new Intent(MainActivity.this, TaskCategoriesActivity.class);
            startActivity(intent);
        });

        buttonBackToLogin.setOnClickListener(v -> {
            Intent intent = new Intent(MainActivity.this, activity_login.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
            finish();
        });

        // Updated click listener for editing tasks
        listViewTasks.setOnItemClickListener((parent, view, position, id) -> {
            String selectedTask = tasks.get(position);
            String[] taskParts = selectedTask.split(" - ");

            Intent intent = new Intent(MainActivity.this, EditTaskActivity.class);
            intent.putExtra("task_position", position);
            intent.putExtra("task_title", taskParts[0]);
            intent.putExtra("task_description", taskParts[1]);
            intent.putExtra("task_due_date", taskParts[2]);
            intent.putExtra("task_priority", taskParts[3]);
            startActivityForResult(intent, EDIT_TASK_REQUEST);
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode == Activity.RESULT_OK && data != null) {
            if (requestCode == ADD_TASK_REQUEST) {
                String newTask = data.getStringExtra("new_task");
                if (newTask != null) {
                    tasks.add(newTask);
                    adapter.notifyDataSetChanged();
                    Toast.makeText(this, "Task added successfully", Toast.LENGTH_SHORT).show();
                }
            } else if (requestCode == EDIT_TASK_REQUEST) {
                int position = data.getIntExtra("task_position", -1);
                String action = data.getStringExtra("action");

                if (position != -1) {
                    if ("delete".equals(action)) {
                        tasks.remove(position);
                        Toast.makeText(this, "Task deleted successfully", Toast.LENGTH_SHORT).show();
                    } else if ("update".equals(action)) {
                        String updatedTask = data.getStringExtra("updated_task");
                        if (updatedTask != null) {
                            tasks.set(position, updatedTask);
                            Toast.makeText(this, "Task updated successfully", Toast.LENGTH_SHORT).show();
                        }
                    }
                    adapter.notifyDataSetChanged();
                }
            }
        }
    }
}
