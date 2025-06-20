package com.example.demo1
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.example.demo1.ui.theme.Demo1Theme
import androidx.compose.ui.unit.dp
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.ui.Alignment
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.sp

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            Demo1Theme {
                ProfileScreen()
            }
        }
    }
}

@Composable
fun ProfileScreen() {
    Box(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
    ) {
        Column(
            modifier = Modifier.fillMaxSize(),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            // Avatar
            Box(
                modifier = Modifier
                    .size(120.dp)
                    .clip(CircleShape)
                    .background(Color(0xFFFF5B5B)), // Red circle background
                contentAlignment = Alignment.Center
            ) {
                Image(
                    painter = painterResource(id = R.drawable.avatar), // Thay bằng ảnh avatar bạn có
                    contentDescription = "Avatar",
                    modifier = Modifier.size(80.dp)
                )
            }

            Spacer(modifier = Modifier.height(24.dp))

            Text(
                text = "Nguyễn Văn Quốc Lâm - CN22F",
                style = TextStyle(fontWeight = FontWeight.Bold, fontSize = 16.sp),
                color = Color.Black
            )

            Spacer(modifier = Modifier.height(12.dp))

            // Câu hỏi
            Text(
                text = "Mong muốn có thể phát triển được các dự án trên nền tảng thiết bị di động. Dự định phát triển song song các dự án phần mềm máy tính và phần mềm di động để thuận tiện hơn cho người dùng.",
                textAlign = TextAlign.Center,
                style = TextStyle(color = Color.Gray, fontSize = 14.sp)
            )
        }
    }
}