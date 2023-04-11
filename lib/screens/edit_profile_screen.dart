import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:ui' as ui;

import '../constants/constants.dart';

enum Gender {
  male,
  female,
  nonbinary,
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phonNoController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _passwordController;
  bool loggedIn = false;
  bool isObscure = true;

  @override
  void initState() {
    // Initialize all controllers.
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phonNoController = TextEditingController();
    _birthDateController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose all controllers.
    _fullNameController.dispose();
    _emailController.dispose();
    _phonNoController.dispose();
    _birthDateController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final picker = ImagePicker();
  File? _profileImage;
  File? _backgroundImage;

  Future<bool> _requestCameraPermission() async {
    var result = await Permission.camera.request();
    if (result == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _requestGalleryPermission() async {
    var result = await Permission.photos.request();
    if (result == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _takeProfilePictureFromCamera() async {
    var cameraAllowed = await _requestCameraPermission();
    if (cameraAllowed) {
      // Access the camera and take a picture
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          _profileImage = File(pickedFile.path);
        }
      });
    } else {
      // Show an error message
    }
  }

  Future<void> _selectProfilePictureFromGallery() async {
    var galleryAllowed = await _requestGalleryPermission();
    if (galleryAllowed) {
      // Access the gallery and select a picture
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _profileImage = File(pickedFile.path);
        }
      });
    } else {
      // Show an error message
    }
  }

  Future<void> _takeBackgroundPictureFromCamera() async {
    var cameraAllowed = await _requestCameraPermission();
    if (cameraAllowed) {
      // Access the camera and take a picture
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          _backgroundImage = File(pickedFile.path);
        }
      });
    } else {
      // Show an error message
    }
  }

  Future<void> _selectBackgroundPictureFromGallery() async {
    var galleryAllowed = await _requestGalleryPermission();
    if (galleryAllowed) {
      // Access the gallery and select a picture
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _backgroundImage = File(pickedFile.path);
        }
      });
    } else {
      // Show an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleTextStyle: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            color: AppConstants.fontColor),
        title: const Text('Edit Profile'),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 23),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: AppConstants.prefixIconColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    (_backgroundImage != null)
                        ? Image.asset(
                            _backgroundImage.toString(),
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 375),
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height - 195),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/more_background.png',
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 375),
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height - 195),
                            fit: BoxFit.cover,
                          ),
                    BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: AppConstants.backgroundColor.withOpacity(0.9),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, right: 20),
                        child: IconButton(
                            onPressed: () {
                              _selectBackgroundPictureFromGallery();
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 30.0,
                              color: AppConstants.prefixIconColor,
                            )),
                      ),
                    ),
                    Positioned.fill(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Container(
                            width: MediaQuery.of(context).size.width -
                                (MediaQuery.of(context).size.width - 120),
                            height: MediaQuery.of(context).size.height -
                                (MediaQuery.of(context).size.height - 120),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/profile_pic.png'))),
                            alignment: Alignment.center,
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: MediaQuery.of(context).size.width -
                                      (MediaQuery.of(context).size.width - 32),
                                  height: MediaQuery.of(context).size.height -
                                      (MediaQuery.of(context).size.height - 32),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppConstants
                                          .editProfileCameraIconBackgroundColor),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.camera,
                                      color: AppConstants.prefixIconColor,
                                      size: 16,
                                    ),
                                    onPressed: () {},
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height - 24),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildNameTf(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 16),
                      ),
                      buildEmailTf(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 16),
                      ),
                      buildPhoneNoTf(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 16),
                      ),
                      buildBirthDateTf(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 16),
                      ),
                      buildGenderTf(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 16),
                      ),
                      buildPasswordTf(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height - 23),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Create email textfield widget
  Widget buildNameTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Full Name',
          style: TextStyle(
              fontSize: 10, color: AppConstants.fontColor.withOpacity(0.7)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 8),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 56),
          child: TextFormField(
            controller: _fullNameController,
            autofocus: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.name,
            style: TextStyle(
                color: AppConstants.fontColor.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: AppConstants.fontColor.withOpacity(0.12))),
                hintText: 'Enter your full name here',
                hintStyle:
                    TextStyle(color: AppConstants.fontColor.withOpacity(0.12)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: AppConstants.fontColor.withOpacity(0.38),
                )),
            validator: ((value) {
              if (value!.isEmpty ||
                  !RegExp(r"([a-zA-Z',.-]+( [a-zA-Z',.-]+)*){2,30}$")
                      .hasMatch(value)) {
                return "Enter Correct Full Name";
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }

  // Create email textfield widget
  Widget buildEmailTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email Address',
          style: TextStyle(
              fontSize: 10, color: AppConstants.fontColor.withOpacity(0.7)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 8),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 56),
          child: TextFormField(
            controller: _emailController,
            autofocus: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: AppConstants.fontColor.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: AppConstants.fontColor.withOpacity(0.12))),
                hintText: 'Enter your email here',
                hintStyle:
                    TextStyle(color: AppConstants.fontColor.withOpacity(0.12)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: AppConstants.fontColor.withOpacity(0.38),
                )),
            validator: ((value) {
              if (value!.isEmpty ||
                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                return "Enter Correct Email Address";
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }

  // Create email textfield widget
  Widget buildPhoneNoTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone Number',
          style: TextStyle(
              fontSize: 10, color: AppConstants.fontColor.withOpacity(0.7)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 8),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 56),
          child: TextFormField(
            controller: _phonNoController,
            autofocus: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                color: AppConstants.fontColor.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: AppConstants.fontColor.withOpacity(0.12))),
                hintText: 'Enter your phone number here',
                hintStyle:
                    TextStyle(color: AppConstants.fontColor.withOpacity(0.12)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: AppConstants.fontColor.withOpacity(0.38),
                )),
            validator: ((value) {
              if (value!.isEmpty ||
                  !RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
                      .hasMatch(value)) {
                return "Enter Correct Phone Number";
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }

  // Create email textfield widget
  Widget buildBirthDateTf() {
    DateTime? _selectedDate;
    String? _validateDate(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your birthdate';
      }
      try {
        final date = DateFormat('MM/dd/yyyy').parseStrict(value);
        if (date.isAfter(DateTime.now())) {
          return 'Birthdate can\'t be in the future';
        }
        if (DateTime.now().difference(date).inDays < 365 * 18) {
          return 'You must be 18 years or older to use this app';
        }
        _selectedDate = date;
      } on FormatException {
        return 'Please enter a valid date in MM/dd/yyyy format';
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Birth Date',
          style: TextStyle(
              fontSize: 10, color: AppConstants.fontColor.withOpacity(0.7)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 8),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 56),
          child: TextFormField(
            controller: _birthDateController,
            autofocus: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.datetime,
            style: TextStyle(
                color: AppConstants.fontColor.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: AppConstants.fontColor.withOpacity(0.12))),
                hintText: 'Enter your birthdate here',
                hintStyle:
                    TextStyle(color: AppConstants.fontColor.withOpacity(0.12)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                prefixIcon: Icon(
                  Icons.calendar_month_outlined,
                  color: AppConstants.fontColor.withOpacity(0.38),
                )),
            validator: _validateDate,
            onTap: () async {
              final DateTime? date = await showDatePicker(
                context: context,
                initialDate: _selectedDate ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                _fullNameController.text =
                    DateFormat('MM/dd/yyyy').format(date);
                _fullNameController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _fullNameController.text.length));
                setState(() {
                  _selectedDate = date;
                });
              }
            },
          ),
        )
      ],
    );
  }

  // Create email textfield widget
  Widget buildGenderTf() {
    Gender? _selectedGender;
    String? _validateGender(Gender? value) {
      if (value == null) {
        return 'Please select your gender';
      }
      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Gender',
          style: TextStyle(
              fontSize: 10, color: AppConstants.fontColor.withOpacity(0.7)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 8),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 56),
          child: DropdownButtonFormField<Gender>(
              autofocus: true,
              dropdownColor: AppConstants.backgroundColor,
              style: TextStyle(
                  color: AppConstants.fontColor.withOpacity(0.4),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                          color: AppConstants.fontColor.withOpacity(0.12))),
                  hintText: 'Enter your gender here',
                  hintStyle: TextStyle(
                      color: AppConstants.fontColor.withOpacity(0.12)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: AppConstants.fontColor.withOpacity(0.38),
                  )),
              value: _selectedGender,
              items: const [
                DropdownMenuItem(
                  value: Gender.male,
                  child: Text('Male'),
                ),
                DropdownMenuItem(
                  value: Gender.female,
                  child: Text('Female'),
                ),
                DropdownMenuItem(
                  value: Gender.nonbinary,
                  child: Text('Nonbinary'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              validator: _validateGender),
        )
      ],
    );
  }

  // Create password textfield widget
  Widget buildPasswordTf() {
    // double passStrength = 0;
    String displayText = 'Please enter a password';
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp letterReg = RegExp(r".*[A-Za-z].*");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              fontSize: 10, color: AppConstants.fontColor.withOpacity(0.7)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 8),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 56),
          child: TextFormField(
            controller: _passwordController,
            enableSuggestions: false,
            obscureText: isObscure,
            autocorrect: false,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
                color: AppConstants.fontColor.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: AppConstants.fontColor.withOpacity(0.12))),
                hintText: displayText,
                border: InputBorder.none,
                hintStyle:
                    TextStyle(color: AppConstants.fontColor.withOpacity(0.12)),
                contentPadding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: AppConstants.fontColor.withOpacity(0.38),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppConstants.fontColor.withOpacity(0.38),
                )),
            validator: ((value) {
              if (value!.isEmpty ||
                  (!letterReg.hasMatch(value) && !numReg.hasMatch(value))) {
                return "Enter Correct Password";
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool loggedIn = false;
  bool isObscure = true;

  @override
  void initState() {
    // Initialize all controllers.
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose all controllers.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Create email textfield widget
  Widget buildEmailTf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              fontSize: 10, color: AppConstants.fontColor.withOpacity(0.7)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height - 8),
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: emailController,
            autofocus: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: AppConstants.fontColor.withOpacity(0.4),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
                hintText: 'Enter your email here',
                // hintStyle: kHintTextStyle,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: AppConstants.fontColor.withOpacity(0.38),
                )),
            validator: ((value) {
              if (value!.isEmpty ||
                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                return "Enter Correct Email Address";
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }

  // Create password textfield widget
  Widget buildPasswordTf() {
    // double passStrength = 0;
    String displayText = 'Please enter a password';
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp letterReg = RegExp(r".*[A-Za-z].*");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              fontSize: 10, color: AppConstants.fontColor.withOpacity(0.7)),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: passwordController,
            enableSuggestions: false,
            obscureText: isObscure,
            autocorrect: false,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: AppConstants.fontColor.withOpacity(0.4)),
            decoration: InputDecoration(
                hintText: displayText,
                // hintStyle: kHintTextStyle,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: AppConstants.fontColor.withOpacity(0.38),
                )),
            validator: ((value) {
              if (value!.isEmpty ||
                  (!letterReg.hasMatch(value) && !numReg.hasMatch(value))) {
                return "Enter Correct Password";
              } else {
                return null;
              }
            }),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height - 536),
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width - 375),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    AppConstants.backgroundColor,
                    // AppColor.secondayBgColor
                  ],
                      stops: [
                    0.1,
                    0.7
                  ])),
            ),
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                // padding: const EdgeInsets.symmetric(
                //     horizontal: AppColor.defaultPadding * 2.5,
                //     vertical: AppColor.defaultPadding * 9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildEmailTf(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    buildPasswordTf(),
                    // buildForgotPassword(),
                    // buildRemeberCheckbox(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    // buildLoginBtn(),

                    // buildSignInWithText(),
                    // buildSocialBtnRow(),
                    // buildSignUpBtn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
