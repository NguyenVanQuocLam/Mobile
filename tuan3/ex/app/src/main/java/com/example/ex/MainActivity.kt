package com.example.ex

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier



class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            DemoLayout()
        }
    }
}

@Composable
fun DemoLayout() {
    Column {
        Row {
            Text(
                modifier = Modifier.background(color = F00000),
                    .border(width = 1.dp, color = F00000)
                    .padding(16.dp),
                text = "",
            )
            Text(
                text = "",
            )
        }
        Text(
            text = "",
        )
    }
}
