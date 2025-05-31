import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class LoginScreen003 extends StatefulWidget {
  const LoginScreen003({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen003> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget buildTopWave(double height) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Color(0xFF4C7BFF), Color(0xFF6B8AFF)],
            [Color(0xFF6B8AFF), Color(0xFF4C7BFF)],
          ],
          durations: [35000, 19440],
          heightPercentages: [0.20, 0.25],
          blur: MaskFilter.blur(BlurStyle.solid, 5),
          gradientBegin: Alignment.topLeft,
          gradientEnd: Alignment.bottomRight,
        ),
        waveAmplitude: 0,
        backgroundColor: Colors.white,
        size: Size(double.infinity, double.infinity),
      ),
    );
  }

  void _login() {
    print('Username: ${_usernameController.text}');
    print('Password: ${_passwordController.text}');
  }

  void _register() {
    print('Register button pressed');
  }

  void _forgotPassword() {
    print('Forgot Password? pressed');
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(screenSize.width, screenSize.height*0.45),
              painter: TopWavePainter_Light(),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: CustomPaint(
              size: Size(screenSize.width, screenSize.height*0.4),
              painter: TopWavePainter(),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: CustomPaint(
              size: Size(screenSize.width, screenSize.height*0.4),
              painter: BottomWavePainter_Light(),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: CustomPaint(
              size: Size(screenSize.width, screenSize.height*0.3),
              painter: BottomWavePainter(),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),
                  _buildLoginTitle(),
                  SizedBox(height: 40,),
                  _buildInputFields(),
                  SizedBox(height: 12,),
                  _buildForgotPasswordButton(),
                  SizedBox(height: 25,),
                  _buildLoginButton(),

                  SizedBox(height: 25,),
                  _buildSignUpRow(),

                  SizedBox(height: 25,),
                  _buildOrSeparator(),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(Icons.facebook, (){
                        //login with facebook
                      }),
                      SizedBox(width: 20,),
                      _buildSocialButton(Icons.g_mobiledata, (){
                        //login with google
                      }, isGoogle: true)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Widget _buildSocialButton(IconData icon, VoidCallback onPressed, {bool isGoogle = false}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: isGoogle
              ? Image.asset(
            'assets/images/google_logo.png', // Bạn cần thêm icon Google vào thư mục assets
            height: 30,
            width: 30,
          )
              : Icon(
            icon,
            color: icon == Icons.facebook ? Colors.blue : Colors.red, // Màu sắc tạm thời
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginTitle() {
    return Text(
      'Login',
      style: TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildInputFields() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: 2,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person_outline, color: Colors.grey[600]),
                hintText: 'Username',
                border: InputBorder.none,
              ),
            ),
          ),
          Divider(
              indent: 20, endIndent: 20, height: 1, color: Colors.grey[300]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.grey[600]),
                hintText: 'Password',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _forgotPassword,
        child: Text(
          'Forgot password?',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        ElevatedButton(
          onPressed: _login,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4C7BFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            elevation: 5,
          ),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          right: 12,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(6),
            child: Icon(
              Icons.arrow_forward,
              color: Color(0xFF4C7BFF),
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildSignUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'New user? ',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to registration screen
            print('Sign Up tapped');
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFF3A7BD5), // Deep purple color for the link
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrSeparator() {
    return const Text(
      'OR',
      style: TextStyle(color: Colors.grey, fontSize: 16),
    );
  }

}

// Custom Painter cho sóng trên
class TopWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFF9D4A), Color(0xFFFF5D00)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, size.height * 0.4) // Bắt đầu cao hơn (40%)
      ..quadraticBezierTo(
        size.width * 0.25, size.height * 0.25, // Đỉnh nhẹ bên trái
        size.width * 0.5, size.height * 0.3,   // Hõm giữa
      )
      ..quadraticBezierTo(
        size.width * 0.75, size.height * 0.35, // Sóng nhẹ lên lại
        size.width, size.height * 0.2,         // Kết thúc hơi thấp
      )
      ..lineTo(size.width, 0) // Viền phải lên đỉnh
      ..lineTo(0, 0) // Trở về trái trên
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)], // Giữ màu sắc như cũ
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    // Bắt đầu từ góc dưới bên trái của vùng vẽ, nhưng ở một độ cao nhất định (thay vì 0)
    // Điều chỉnh điểm bắt đầu để nó nằm trên "đường trung bình" của sóng hoặc hơi thấp hơn
    path.moveTo(0, size.height * 0.7); // Bắt đầu ở 80% chiều cao (rất thấp)

    // Sóng 1: Tạo một nhịp sóng lớn và mềm mại hướng lên
    path.quadraticBezierTo(
      size.width * 0.2, // control point x (kéo về bên trái một chút)
      size.height * 0.6, // control point y (kéo lên cao hơn để tạo đỉnh)
      size.width * 0.5,  // end point x (điểm kết thúc nhịp đầu tiên)
      size.height * 0.75, // end point y (kết thúc hơi thấp hơn điểm bắt đầu)
    );

    // Sóng 2: Tạo một nhịp sóng mềm mại hướng xuống, trải rộng hơn
    path.quadraticBezierTo(
      size.width * 0.8, // control point x (kéo về bên phải để sóng rộng)
      size.height * 0.9, // control point y (kéo xuống thấp hơn nữa để tạo hõm sâu)
      size.width,        // end point x (kết thúc ở mép phải)
      size.height * 0.7, // end point y (về lại độ cao ban đầu hoặc hơi thấp hơn)
    );

    // Đóng đường dẫn để tạo hình dạng kín
    path.lineTo(size.width, size.height); // Đường thẳng xuống góc dưới bên phải
    path.lineTo(0, size.height);         // Đường thẳng sang góc dưới bên trái
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TopWavePainter_Light extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFC080), Color(0xFFFFB080)], // Màu cam/đỏ cam nhạt hơn
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, size.height * 0.4) // Bắt đầu thấp hơn một chút so với sóng chính
      ..quadraticBezierTo(
        size.width * 0.20, size.height * 0.25, // Đỉnh nhẹ bên trái, thấp hơn
        size.width * 0.55, size.height * 0.3, // Hõm giữa, thấp hơn và rộng hơn
      )
      ..quadraticBezierTo(
        size.width * 0.80, size.height * 0.35, // Sóng nhẹ lên lại, thấp hơn
        size.width, size.height * 0.2,         // Kết thúc hơi thấp, thấp hơn
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Custom Painter cho lớp sóng dưới nhạt hơn
class BottomWavePainter_Light extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFB0DFFF), Color(0xFF80E0FF)], // Màu xanh dương nhạt hơn
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    path.moveTo(0, size.height * 0.75); // Bắt đầu cao hơn một chút so với sóng chính

    // Sóng 1: Tạo một nhịp sóng lớn và mềm mại hướng lên, nhưng ít extreme hơn
    path.quadraticBezierTo(
      size.width * 0.25, // control point x
      size.height * 0.67, // control point y (ít cao hơn)
      size.width * 0.55,  // end point x
      size.height * 0.80, // end point y (ít thấp hơn)
    );

    // Sóng 2: Tạo một nhịp sóng mềm mại hướng xuống, trải rộng hơn, ít extreme hơn
    path.quadraticBezierTo(
      size.width * 0.85, // control point x
      size.height * 0.9, // control point y (ít sâu hơn)
      size.width,         // end point x
      size.height * 0.72, // end point y (ít thấp hơn)
    );

    // Đóng đường dẫn để tạo hình dạng kín
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}