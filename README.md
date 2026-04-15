# 🎓 Grade Tracker

## 📘 Project Overview

Grade Tracker is a mobile application built with Flutter that helps students track and manage their academic performance across multiple subjects.

The application allows users to store grades, organize them by category (RK1, RK2, Rating, Current), and automatically calculate average scores.

It solves the problem of scattered and unstructured grade tracking by providing a clean and centralized interface.

The target users are students who want to stay organized and monitor their academic progress.

- --

## ⚙️ Features

- Add new subjects
- View all subjects with average scores
- Open subject details
- Add grades to a subject
- Edit existing grades
- Delete one or multiple grades
- Categorize grades (RK1, RK2, Rating, Current)
- Instant UI updates without page reload
- --

## 👥 Target Users

- Students
- Individual users tracking academic performance
- --

## 🧰 Technology Stack

- **Frontend:** Flutter (Dart)
- **Backend:** Supabase
- **Database:** PostgreSQL (via Supabase)
- **State Management:** setState
- **Navigation:** Navigator (Flutter routing)
- --

## 🏗 System Architecture

The application follows a simple client–server architecture:

- Flutter mobile app (client)
- Supabase (backend as a service)
- PostgreSQL database

The frontend communicates with Supabase using HTTP requests via the Supabase SDK.

- --

## 🗄 Data Model

### Subjects

- `id` — unique identifier
- `name` — subject name

### Grades

- `id` — unique identifier
- `subject_id` — reference to subject
- `type` — grade category (rk1, rk2, rating, current)
- `value` — numeric grade
- --

## 🌐 API Usage (Supabase)

The application uses Supabase built-in API:

- `select()` — fetch data
- `insert()` — add subject/grade
- `update()` — edit grade
- `delete()` — remove grade
- --

## 🧪 Testing

Manual testing was performed for the following cases:

- Adding a subject → appears in list
- Adding a grade → updates UI and average score
- Editing a grade → value changes correctly
- Deleting grades → removed from database
- Invalid input → prevented or handled
- --

## 🔐 Basic Security

- Input validation prevents empty values
- Data is validated before sending to the database
- Supabase handles secure database access
- --
