import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for SystemChrome
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import this package for social icons

class MofinowLoginScreen extends StatefulWidget {
  const MofinowLoginScreen({super.key});

  @override
  State<MofinowLoginScreen> createState() => _MofinowLoginScreenState();
}

class _MofinowLoginScreenState extends State<MofinowLoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _rememberMe = false; // State for "Remember me" checkbox

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleRememberMe(bool? value) {
    setState(() {
      _rememberMe = value!;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // --- Helper Methods for building UI sections ---

  Widget _buildLogoWidget({required double size}) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
          'assets/images/teamwork.png', // Replace with your actual logo path
          width: 80,
          height: 80,
          // fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildHeaderSection(double screenHeight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: screenHeight * 0.1), // Spacing from the top
        _buildLogoWidget(size: 120),
        const SizedBox(height: 10),
        const Text(
          'COMPANY',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeBackText() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Welcome back !',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRememberMeAndForgotPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 24.0, // Ensure sufficient size for the checkbox
              height: 24.0,
              child: Checkbox(
                value: _rememberMe,
                onChanged: _toggleRememberMe, // Use the new toggle method
                activeColor: Colors.blueAccent, // Color when checked
                checkColor: Colors.white, // Color of the checkmark
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce tap target area
              ),
            ),
            const Text(
              'Remember me',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            // Handle forgot password logic
            print('Forgot password?');
          },
          child: const Text(
            'Forget password?',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle login logic here
        print('Login pressed');
        print('Username: ${_usernameController.text}');
        print('Password: ${_passwordController.text}');
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF6A1B9A), // Login button background color
        minimumSize: const Size(double.infinity, 55), // Button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
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
              color: Color(0xFF6A1B9A), // Deep purple color for the link
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

  // Custom TextField builder function
  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: Icon(icon, color: Colors.grey[600]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none, // No border when not focused
          ),
        ),
      ),
    );
  }

  // Password Field builder function
  Widget _buildPasswordField(TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
          suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Social Icon builder function (using FontAwesomeIcons)
  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
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
        child: FaIcon(
          icon,
          color: color,
          size: 25,
        ),
      ),
    );
  }

  // Google Icon builder function (using Image.asset)
  Widget _buildGoogleIcon() {
    return Container(
      width: 50,
      height: 50,
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
        child: Image.asset(
          'assets/images/google_logo.png', // Replace with your Google icon path
          width: 25,
          height: 25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Set Scaffold background to white
      body: Stack(
        children: [
          Positioned(child: CustomPaint(
            size: Size(screenWidth, screenHeight*0.4),
            painter: WavePainter(
                gradientColors: const [Color(0xFF6A1B9A), Color(0xFF6A1B9A), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          )),
          
          SingleChildScrollView(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth*0.08),
              child: Column(
                children: [
                  _buildHeaderSection(screenHeight),
                  SizedBox(height: screenHeight*0.08,),
                  _buildWelcomeBackText(),

                  const SizedBox(height: 30,),

                  _buildTextField(_usernameController, 'Username', Icons.person),
                  
                  const SizedBox(height: 20,),
                  
                  _buildPasswordField(_passwordController),

                  const SizedBox(height: 20,),

                  _buildRememberMeAndForgotPasswordRow(),

                  const SizedBox(height: 30,),

                  _buildLoginButton(),

                  const SizedBox(height: 20,),

                  _buildSignUpRow(),

                  const SizedBox(height: 20,),
                  _buildOrSeparator(),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(FontAwesomeIcons.twitter, Colors.blueAccent),
                      const SizedBox(width: 20,),

                      _buildSocialIcon(FontAwesomeIcons.linkedin, Colors.blue),
                      const SizedBox(width: 20,),

                      _buildSocialIcon(FontAwesomeIcons.facebook, Colors.blue[700]!),

                      const SizedBox(width: 20,),
                      _buildGoogleIcon(),
                    ],
                  ),

                  SizedBox(height: screenHeight*0.05,)
                ],
              ),),
          )
        ],
      )
    );
  }
}

// WavePainter class (already has English comments from previous turn)
class WavePainter extends CustomPainter {
  final List<Color> gradientColors;
  final Alignment begin;
  final Alignment end;

  WavePainter({
    required this.gradientColors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0); // Start from the top-left corner of CustomPaint
    path.lineTo(size.width, 0); // Draw a straight line to the top-right corner

    // Define the wave path at the bottom of the gradient shape
    // The wave starts from the right edge, curves down in the middle, and curves up at the left edge.
    // Adjust values like 0.8, 0.9, 0.85 to change the wave's shape.
    path.lineTo(size.width, size.height * 0.8); // Starting point of the wave on the right
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.9, // Control point (curves down)
      size.width * 0.5, size.height * 0.85, // Midpoint of the wave
    );
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.8, // Control point (curves up)
      0, size.height * 0.85, // End point of the wave on the left
    );

    path.close(); // Close the path to form a closed shape (back to 0,0)

    // Create LinearGradient with the provided colors
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: begin,
        end: end,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)); // Apply gradient to the entire CustomPaint size

    canvas.drawPath(path, paint); // Draw the path with the gradient
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) {
    // Only repaint if gradient colors or begin/end alignments change
    return oldDelegate.gradientColors != gradientColors ||
        oldDelegate.begin != begin ||
        oldDelegate.end != end;
  }
}