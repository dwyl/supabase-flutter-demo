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
[dwyl/**lutter-todo-list-tutorial**](https://github.com/dwyl/flutter-todo-list-tutorial)
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
`dwyl/lutter-todo-list-tutorial`.
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

