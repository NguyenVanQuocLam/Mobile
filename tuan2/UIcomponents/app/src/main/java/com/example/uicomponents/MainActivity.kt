@file:OptIn(ExperimentalMaterial3Api::class)

package com.example.uicomponents

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import androidx.core.view.WindowCompat
import androidx.compose.material3.MaterialTheme



class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        WindowCompat.setDecorFitsSystemWindows(window, false)
        enableEdgeToEdge()
        setContent {
            MaterialTheme {
                UIComponentsApp()
            }
        }
    }
}

@Composable
fun UIComponentsApp() {
    val navController = rememberNavController()
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(WindowInsets.safeDrawing.asPaddingValues())
    ){
    NavHost(navController, startDestination = "welcome") {
        composable("welcome") { WelcomeScreen(navController) }
        composable("components") { ComponentListScreen(navController) }
        composable("textDetail") { TextDetailScreen(navController) }
        composable("imageDetail") { ImageDetailScreen(navController) }
    }
}}

@Composable
fun WelcomeScreen(navController: NavController) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Spacer(modifier = Modifier.weight(1f))
        Image(painterResource(id = R.drawable.compose), contentDescription = "Compose Logo")
        Spacer(modifier = Modifier.height(24.dp))
        Text("Jetpack Compose", fontSize = 24.sp, fontWeight = FontWeight.Bold)
        Text(
            "Jetpack Compose is a modern UI toolkit for building native Android applications using a declarative programming approach.",
            textAlign = TextAlign.Center
        )
        Spacer(modifier = Modifier.weight(1f))
        Button(
            colors = ButtonDefaults.buttonColors(
                containerColor = Color(0xFF2196F3),
                contentColor = Color.White
            ),
            modifier = Modifier
                .fillMaxWidth(),
            onClick = { navController.navigate("components") }
        ) {
            Text("I'm ready")
        }
    }
}

@Composable
fun ComponentListScreen(navController: NavController) {
    Column(modifier = Modifier.padding(16.dp)) {
        Text(
            text = "UI Components List",
            modifier = Modifier
                .fillMaxWidth(),
            textAlign = TextAlign.Center,
            fontSize = 28.sp,
            fontWeight = FontWeight.Bold,
            color = Color(0xFF007AFF),
        )

        Text("Display")
        ComponentItem("Text", "Displays text") { navController.navigate("textDetail") }
        ComponentItem("Image", "Displays an image") {navController.navigate("imageDetail")}

        Text("Input")
        ComponentItem("TextField", "Input field for text") {}
        ComponentItem("PasswordField", "Input field for passwords") {}

        Text("Layout")
        ComponentItem("Column", "Arranges elements vertically") {}
        ComponentItem("Row", "Arranges elements horizontally") {}
    }
}

@Composable
fun ComponentItem(title: String, subtitle: String, onClick: () -> Unit) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp)
            .clickable { onClick() },
        colors = CardDefaults.cardColors(containerColor = Color(0xFFE0F2FF))
    ) {
        Column(modifier = Modifier.padding(12.dp)) {
            Text(title, fontWeight = FontWeight.Bold)
            Text(subtitle, style = MaterialTheme.typography.bodyMedium)
        }
    }
}

@Composable
fun TextDetailScreen(navController: NavController) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier
                .fillMaxWidth()
        ) {
            IconButton(onClick = { navController.popBackStack() }) {
                Icon(
                    painter = painterResource(id = R.drawable.ic_back),
                    contentDescription = "Back",
                    tint = Color(0xFF007AFF),
                    modifier = Modifier
                        .padding(top = 8.dp)
                )
            }


            Text(
                text = "Text Detail",
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold,
                color = Color(0xFF007AFF),
                modifier = Modifier.weight(1f),
                textAlign = TextAlign.Center
            )

            Spacer(modifier = Modifier.width(48.dp))
        }

        Spacer(modifier = Modifier.height(32.dp))

        Text(
            buildAnnotatedString {
                append("The ")
                withStyle(style = SpanStyle(textDecoration = TextDecoration.LineThrough)) {
                    append("quick")
                }
                withStyle(style = SpanStyle(color = Color(0xFFBB8600), fontWeight = FontWeight.Bold)) {
                    append(" Brown ")
                }
                append("fox ")
                append("j ")
                append("u ")
                append("m ")
                append("p ")
                append("s ")
                withStyle(style = SpanStyle(fontWeight = FontWeight.Bold)) {
                    append("over ")
                }
                append("the ")
                withStyle(style = SpanStyle(fontStyle = FontStyle.Italic)) {
                    append("lazy ")
                }
                append("dog.")
            },
            fontSize = 24.sp
        )
    }
}

@Composable
fun ImageDetailScreen(navController: NavController) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.fillMaxWidth()
        ) {
            IconButton(onClick = { navController.popBackStack() }) {
                Icon(
                    painter = painterResource(id = R.drawable.ic_back),
                    contentDescription = "Back",
                    tint = Color(0xFF007AFF),
                    modifier = Modifier
                        .padding(top = 8.dp)
                )
            }

            Spacer(modifier = Modifier.width(8.dp))

            Text(
                text = "Images",
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold,
                color = Color(0xFF007AFF),
                modifier = Modifier.weight(1f),
                textAlign = TextAlign.Center
            )

            Spacer(modifier = Modifier.width(48.dp)) // Để căn giữa tiêu đề
        }

        Image(painterResource(id = R.drawable.uth), contentDescription = "UTH")

        Spacer(modifier = Modifier.height(8.dp))

        Text(
            text = "https://giaothongvantaihcm.edu.vn/wp-content/uploads/2025/01/Logo-GTVT.png",
            textAlign = TextAlign.Center,
            color = Color.Blue,
            textDecoration = TextDecoration.Underline
        )

        Spacer(modifier = Modifier.height(32.dp))

        Text(
            text = "In app",
            textAlign = TextAlign.Center,
            modifier = Modifier.fillMaxWidth(),
            color = Color.Gray
        )
    }
}
