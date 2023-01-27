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

