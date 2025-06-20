# mvvm

Model (TaskModel): Định nghĩa cấu trúc dữ liệu của task với các trường id, title, description và status.
ViewModel (TaskViewModel): Quản lý business logic và state của ứng dụng. Sử dụng ChangeNotifier để thông báo thay đổi tới View.
View (TaskListScreen, AddTaskScreen): Hiển thị UI và tương tác với người dùng. Sử dụng Consumer để lắng nghe thay đổi từ ViewModel.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
