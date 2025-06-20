package com.example.email

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.example.email.ui.theme.*

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            EmailValidation()
        }
    }
}

@Composable
fun EmailValidation() {
    var email by remember { mutableStateOf("") }
    var isError by remember { mutableStateOf(false) }

    Box(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 16.dp),
        contentAlignment = Alignment.Center
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .wrapContentHeight()
                .background(
                    color = White,
                    shape = RoundedCornerShape(33.dp)
                )
                .padding(24.dp), // padding đều 4 phía
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = "Thực hành 02",
                style = Typography.headlineLarge,
                color = Black
            )

            Spacer(modifier = Modifier.height(14.dp))

            OutlinedTextField(
                value = email,
                onValueChange = {
                    email = it
                    isError = false
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(50.dp),
                placeholder = {
                    Text(
                        text = "Email",
                        color = TextFieldBorder
                    )
                },
                colors = TextFieldDefaults.colors(
                    focusedContainerColor = White,
                    unfocusedContainerColor = White,
                    focusedIndicatorColor = TextFieldBorder,
                    unfocusedIndicatorColor = TextFieldBorder,
                    errorIndicatorColor = ErrorRed
                ),
                shape = RoundedCornerShape(20.dp),
                singleLine = true,
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Email),
                isError = isError
            )

            if (isError) {
                Spacer(modifier = Modifier.height(16.dp))
                Text(
                    text = "Email không đúng định dạng",
                    color = ErrorRed,
                    style = Typography.bodyMedium,
                    textAlign = TextAlign.Center
                )
            }

            Spacer(modifier = Modifier.height(12.dp))

            Button(
                onClick = {
                    isError = !android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(56.dp),
                shape = RoundedCornerShape(50.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = Blue,
                    contentColor = White
                )
            ) {
                Text(
                    text = "Kiểm tra",
                    style = Typography.labelLarge
                )
            }
        }
    }
}

@Composable
@Preview(showBackground = true)
fun EmailValidationPreview() {
    MaterialTheme {
        EmailValidation()
    }
}