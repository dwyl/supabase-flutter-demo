<div align="center">

# `Supabase` + `Flutter` _`Demo`_

A showcase of using `Supabase`
with `Flutter`
in a simple `Flutter` Todo List App 
with authentication

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/dwyl/supabase-flutter-demo/ci.yml?label=build&style=flat-square&branch=main)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/supabase-flutter-demo/master.svg?style=flat-square)](http://codecov.io/github/dwyl/supabase-flutter-demo?branch=master)
[![HitCount](https://hits.dwyl.com/dwyl/supabase-flutter-demo.svg?style=flat-square&show=unique)](http://hits.dwyl.com/dwyl/supabase-flutter-demo)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/supabase-flutter-demo/issues)


</div>

<br />

# Why? 🤷‍

This SPIKE project is meant for *us* 
to evaluate the possibility of implementing authentication
with `Supabase` whilst developing 
[our `Flutter` app](https://github.com/dwyl/app).

# What? 💭

[`Supabase`](https://supabase.com/)
is a Firebase alternative,
which allows rapid development of a project
with a Postgres database, authentication 
and several other features built-in.

We are going to be using `Supabase` 
with `Flutter` to create
a simple authentication scenario
in a Todo app.

# Who? 👤

This quick demo is aimed at people in the @dwyl team
who need to understand how `Supabase` can be integrated
with `Flutter` to create an authentication flow.

# _How_? 👩‍💻

## Prerequisites? 📝

This `Demo` builds upon the foundational work done
in our **`Flutter` Todo List Tutorial**:
[dwyl/**flutter-todo-list-tutorial**](https://github.com/dwyl/flutter-todo-list-tutorial)
it is 
[_assumed knowledge_](https://en.wikipedia.org/wiki/Curse_of_knowledge). 

If you haven't been through it,
we suggest taking a few minutes 
to get up-to-speed.

If this is your first time using `Flutter`,
we highly suggest you check out
[`dwyl/learn-flutter`](https://github.com/dwyl/learn-flutter)
for a *primer* on how to get up-and-running with `Flutter`.


We recommend you access the following link
and download the project files 
to get the **exact** same ones
we'll be using in this tutorial.

https://github.com/dwyl/flutter-todo-list-tutorial/tree/6b8ac188fa4752c09c22af8915ee51e6e7464098

The reason we are accessing this link 
it's because it belongs to a PR
that *has not been merged*
and it's at a point of the project
where no external API is used.
Therefore, there is no need to setup a local server
to run the application.

If the PR has been merged,
the previous link *might* not work.
If that's the case and this document is not updated,
[please open an issue](https://github.com/dwyl/supabase-flutter-demo/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc)
or create a PR to update the documentation
so it helps everyone! 🙏

## 0. Borrow Baseline Code

Let's start by cloning the code from
`dwyl/flutter-todo-list-tutorial`.
Access the link
and download the project files.

https://github.com/dwyl/flutter-todo-list-tutorial/tree/6b8ac188fa4752c09c22af8915ee51e6e7464098

After cloning the code,
run the following command to fetch the dependencies.

```sh
flutter pub get
```

If you want to know how to run on an emulator
with Visual Studio Code,
check https://github.com/dwyl/learn-flutter#0-setting-up-a-new-project.

If you want to learn how to run on a real-device,
check https://github.com/dwyl/flutter-counter-example#running-on-a-real-device-.

Let's check if all tests pass.
Run `flutter test --coverage`
and you should see the terminal 
stating all tests pass.

```sh
00:04 +4: All tests passed!
```

The base application should look like so,
running on an emulator.

![base-demo](https://user-images.githubusercontent.com/17494745/215099485-71a51357-856b-4cce-989e-7cd6832c2f6b.gif)

It's a simple Todo app, 
where you can toggle between the various states
and see all, active and completed items.

## 1. `Supabase` setup

Before we start building an authentication flow,
we need to setup an account on `Supabase`.
Sign in `Supabase` in the next link -> 
https://app.supabase.com/sign-in?returnTo=%2Fproject%2F_%2Fsql

<img width="798" alt="sign-in" src="https://user-images.githubusercontent.com/17494745/215134801-68458462-5b87-4a04-a6ca-55520460365f.png">

Choose your preferred provider.
In this case, 
we are going to be logging in using *Github*.

After successfully creating your account,
you should be prompted with a dashboard
that allows you to **create a new project**.

<img width="686" alt="new_project" src="https://user-images.githubusercontent.com/17494745/215134792-5e6e4b4a-038d-44ad-939d-39b718728fb3.png">

We are going to be creating a project
for this tutorial.
Click on the `+ New Project` button.

You will be redirected to this page.

<img width="1036" alt="new_project" src="https://user-images.githubusercontent.com/17494745/215134790-57af6bb4-04e3-408e-8313-0628b31ad0b6.png">

In this tutorial,
we are going to create a project called 
`flutter-todo`.

The region closest to us is `Central EU`. 
You can choose the region that is closest to you,
which should yield less latency whilst making API calls.

Choose the `Free` pricing plan,
choose a password for database access
and you should be sorted!

After clicking on `Create new project`,
you will be redirected to the project dashboard.

<img width="1254" alt="project_dashboard_loading" src="https://user-images.githubusercontent.com/17494745/215134784-e2245e5a-9b1f-4f6a-a167-b7dfa302d45d.png">

Notice that there's a pill
stating `"setting up project"`.
This means the database and API endpoints
are being configured. 

If you wait a few minutes, 
you will see your dashboard change to
something similar to the next image.

<img width="1340" alt="project_dashboard_done" src="https://user-images.githubusercontent.com/17494745/215134772-9fd64b31-4058-4c14-a53e-d8089e1467eb.png">

Awesome! 🎉

Now we can start implementing authentication
and *add it* to our Flutter application!

## 2. Creating table in `Supabase`

Let's start implementing this feature
by adding a database in our `Supabase` project.
We are going to be saving the user information
in a database table.

For this, click on the `SQL Editor` button
on the left side of your project.

<img width="1168" alt="project" src="https://user-images.githubusercontent.com/17494745/216006858-32bef198-d08d-4775-a6c8-05bb2338c436.png">

If you scroll down,
you will find a button saying `User Management Starter`.
In here, you will have a *template*
to create a table for the user profiles.

<img width="1436" alt="user_starter" src="https://user-images.githubusercontent.com/17494745/216007177-1540c952-c752-4e96-9ae9-f61d1ec46d28.png">

You may change the `profiles` table to your heart's content.
This setup is a scaffold that will
execute a few setup steps for you.

It will add [**Row-level security**](https://supabase.com/docs/guides/auth/row-level-security),
meaning each user are only allowed to query
*their own information*.


<img width="1149" alt="table_creation" src="https://user-images.githubusercontent.com/17494745/216007783-185ccf31-fb5b-44b6-acb7-846d79bd2f0b.png">

For now, just click `Run` on the lower part of the screen.
Your terminal will yield a result
stating `"Success. No rows returned."`.

<img width="850" alt="run" src="https://user-images.githubusercontent.com/17494745/216009012-92102bad-7533-45d5-ad68-b78dc87af11f.png">

Awesome! 🎉

You've just created the table to store
your app's user information!

## 3. Getting the `API` keys

Now that we have created our database table,
we need to know how to *make operations on it*.
For this, we can use the 
**API that was generated on start-up**.

Our Flutter app will call this API
during the authentication process.

For this, we need to get the `url` 
and the `anon` key from the API settings.

For this, go to `Project Settings` in your side bar.

<img width="686" alt="settings" src="https://user-images.githubusercontent.com/17494745/216010688-b9c5db42-3972-4614-9729-4b4be9b79b6a.png">

And click on `API`.

<img width="884" alt="api_button" src="https://user-images.githubusercontent.com/17494745/216010921-7a14e6d7-a4d5-442b-af88-bf919c4bcbe3.png">

After this, you should be able 
to see the necessary keys/information
to make requests to the API.
You will find the API `url`, 
`anon` and `service_role` keys 
in this page.

<img width="1208" alt="keys" src="https://user-images.githubusercontent.com/17494745/216012231-8cba626d-e46d-43c5-95f3-fad69d9963de.png">

## 4. Integrating with the app

Now that we have all the necessary
tables, API and keys created,
we may now start integrating `Supabase` 
in our `Flutter` app!

### 4.1 Adding `Supabase`-specific dependencies and configurations

Let's start with the dependencies
we need *that are related to `Supabase`*.

In `pubspec.yaml`, 
add [`supabase_flutter`](https://pub.dev/packages/supabase_flutter)
to the dependencies section
and run `flutter pub get`.

With this package, we will be able 
to authenticate through `Supabase` 
in a much easier manner.

By default, 
if we were to implement authentication
with `Supabase`,
people using the app would 
only be able to complete the auth
process
with e-mail confirmation.

In order to simplify this tutorial,
we will *disable e-mail confirmation*,
so only an e-mail and password are needed
to showcase the authentication flow
*in and out* of the app.

To do this,
go to your project's dashboard
and click on `Authentication`.

<img width="1140" alt="auth" src="https://user-images.githubusercontent.com/17494745/216115534-c35fa017-9a0e-43ae-bb54-8a850ae42dd4.png">

Click on `Providers` 
and open the `E-mail` blade.
Disable the `Confirm e-mail` switch.

<img width="1241" alt="provider" src="https://user-images.githubusercontent.com/17494745/216115753-8e07808b-e7b0-4432-a99d-924724218a72.png">

And that's it!

### 4.2 Adding main function and constants

Let's start coding! 🧑‍💻

Let's initialize the `Supabase` client
inside our `main` function 
with the **API credentials**
that we visited prior.

Copy `url` and `anon` keys 
and change the `main` function 
inside `main.dart` like so.

```dart
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );
  runApp(const ProviderScope(child: App()));
}
```

Lets create a file with constants
to make it easier to use the `Supabase` client.
We will also add an 
[`extension method declaration`](https://dart.dev/guides/language/extension-methods)
to show a
[snackbar](https://m2.material.io/components/snackbars)
if any authentication error occurs.

These variables will be exposed on the app, 
and that's completely fine since we have 
*Row Level Security* enabled on our database
by default.

Create a file called `lib/constants.dart`
and add the following code.

```dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    ));
  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(message: message, backgroundColor: Colors.red);
  }
}
```

We will use the `supabase` constant
and these snackbar utilities
during the authentication process
in the `Login` and `Sign-Up` screens.

### 4.3 Adding `Splash` Screen

Let's add a splash screen
that will be shown to users right after they open the app.
It will show a loading state
*and retrieve the current session*.

If the user already has an ongoing session,
it will redirect the user accordingly.

Create a new directory in `lib/pages`,
and create `splash.dart` inside it.
Use the following code.

```dart
import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _redirectCalled = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = supabase.auth.currentSession;
    if (session != null) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
```

In here, we are creating a 
*stateful widget*
that shows a `CircularProgressIndicator`
while the app is loading.

The `_redirect` function is called
every time a dependency is changed,
including when the widget is mounted.
Inside this function,
we check if there is any current session.

If there's one, 
the user is redirected to `/home`.
If not, it's redirected to `/login`.

> We've yet to implement these routes.
> Don't worry, we will in the future.

### 4.3 Creating a `Sign-Up` and `Login` Screen

Let's now create a `Sign-Up` screen.
In this screen, 
the person using the app will input
an e-mail and password.

If both are valid,
a profile is created 
and the user is redirected to the app.

Inside `lib/pages`,
create a file called `signup.dart`
and paste the following snippet of code.

```dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _redirecting = false;
  late final StreamSubscription<AuthState> _authStateSubscription;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
    super.initState();
  }

  Future<void> _signUp() async {
    try {
      await supabase.auth.signUp(password: _passwordController.text, email: _emailController.text);
      if (mounted) {
        _emailController.clear();
        _passwordController.clear();

        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Email', hintText: 'Enter a valid email'),
                  validator: (String? value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Password', hintText: 'Enter secure password'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Invalid password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signUp();
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

Let's break this widget down.

We are adding three basic elements:
- two `TextFormFields` 
and associated controllers (`_emailController`
and `_passwordController`) - 
these controllers will manage the state
inside these form fields.
- a `TextButton`, that, when pressed,
triggers the `_signUp()` function which,
in turn,
tries to sign up the user.

The `_signUp()` function
uses the `supabase` constant
we created in `constants.dart`
and tries to create the user.

```dart
  Future<void> _signUp() async {
    try {
      await supabase.auth.signUp(password: _passwordController.text, email: _emailController.text);
      if (mounted) {
        _emailController.clear();
        _passwordController.clear();

        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error occurred');
    }
  }
```

If an error occurs whe signing up,
a snackbar is shown to the user 
detailing what went wrong.

If it's successful,
the user is redirected to `/home`,
which is the main app itself.

Let's create the `Login` page now!
Inside the same directory `lib/pages`,
create `login.dart`.
Use the following code.

```dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/pages/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _redirecting = false;
  late final StreamSubscription<AuthState> _authStateSubscription;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
    super.initState();
  }

  Future<void> _signIn() async {
    try {
      await supabase.auth.signInWithPassword(email: _emailController.text, password: _passwordController.text);
      if (mounted) {
        _emailController.clear();
        _passwordController.clear();

        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Email', hintText: 'Enter a valid email'),
                  validator: (String? value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Password', hintText: 'Enter secure password'),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Invalid password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _signIn();
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpPage()));
                  },
                  child: const Text('New User? Create Account')),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

The `Login` page implementation
shares many similarities to `SignUp`'s.
There are a few differences, though.

We added a `TextButton` that,
when pressed,
redirects the user to the `Sign Up` page,
in case he/she doesn't have an account.

Additionally, inside 
[`initState()`](https://api.flutter.dev/flutter/widgets/State/initState.html),
which is executed when the widget is instantiated,
we check if there's any session change.
If there's one,
it is checked and, if valid,
the user is redirected to `/home`.

In both of these pages,
the `supabase` variable is used.
This constant uses the `supabase_flutter`
package we've installed which,
with the API keys of our project,
communicates with the API
and creates the user when signing up
and manages the user session.

You can check the users created
in https://app.supabase.com/project/_/auth/users.
Choose the project 
and you will see the table of users. 

> This page is inside the `Authentication > Users` button
> in the project's sidebar.

<img width="1201" alt="users" src="https://user-images.githubusercontent.com/17494745/216122696-75e2294c-5853-4775-8c13-4a44aea87cd8.png">

### 4.4 Changing `main.dart`

Now that we have created the necessary pages,
let's *use them* whe the app starts up.

Inside `lib/main.dart`,
let's make a small change.
Locate the line:

```dart
final _currentTodo = Provider<Todo>((ref) => throw UnimplementedError());
```

and *move it* to `providers.dart`,
while changing it to `currentTodo`
(from `_currentTodo`, which makes a variable private).

Now change all the instances
of this variable from `_currentTodo`
to `currentTodo`
inside `main.dart`.

e.g
[`lib/providers.dart`](https://github.com/dwyl/supabase-flutter-demo/blob/d42513c3489dac55ddd1e914e2988c5db4b2860a/lib/providers.dart#L64)

This change is needed to avoid any 
[`depend_on_referenced_packages`](https://dart-lang.github.io/linter/lints/depend_on_referenced_packages.html)
problems along the line.

Let's keep going.
Locate the `App` class
and change it to the following.

```dart
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/pages/login.dart';
import 'package:todo_app/pages/splash.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: <String, WidgetBuilder>{
      '/': (_) => const SplashPage(),
      '/login': (_) => const LoginPage(),
      '/home': (_) => const Home(),
    });
  }
}
```

We've added the **routes**
we mentioned earlier.

The last change we need to do
is to add a **`Logout`** button,
so the user can logout of the app
and be redirected back to the 
`Login` page.

Inside the `Home` class,
locate the `build` method
and change the `appBar`
attribute inside the `Scaffold`.

```dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodos);
    final newTodoController = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'logout',
              onPressed: () async {
                  try {
                    await supabase.auth.signOut();
                    Navigator.of(context).pushReplacementNamed('/');
                  } on AuthException catch (error) {
                    context.showErrorSnackBar(message: error.message);
                  } catch (error) {
                    context.showErrorSnackBar(message: 'Unexpected error occurred');
                  }
                  
                
              },
            ),
          ],
        ),
        body: 
        ...
```

We've added an `IconButton` that,
when pressed,
uses the `supabase` variable
to try and sign the user out.
If it's *not successful*,
a snackbar pops up, 
detailing the error occurred.

## 5. Run the app!

That's all you need to do!
Let's check our app running!

You should see something 
similar to the gif below.

![final](https://user-images.githubusercontent.com/17494745/216282220-f7a62adb-bb7e-4db4-b1eb-99dcc7cf6412.gif)

As you can see, 
the user signs up,
is instantly redirected to the app.
You can logout and login again.

When logging in,
if the user is not found
or any field is invalid,
a snackbar is shown 
on the bottom of the screen.

And that's it! 
Congratulations! 👏

You've just added authentication
to your Flutter app that is *secure*,
meaning no user can tamper with other profiles
or try to impersonate anyone
during the auth process
(thanks to Row-Level Security).

## 6. Other features

This tutorial is *intentionally simple*,
as it's meant to showcase the authentication process
of `Supabase`.

Each profile is stored in the database.
You might have noticed that,
when creating the `profiles` table in the database,
users can also have an `avatar_url`.

`Supabase` allows you to store images
related to users.
`Supabase` does this through `AWS`,
using [`S3` buckets](https://aws.amazon.com/s3/).

You may find more information
on how to integrate this
in https://supabase.com/docs/guides/getting-started/tutorials/with-flutter#bonus-profile-photos.


