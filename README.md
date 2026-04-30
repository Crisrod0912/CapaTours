# 🌋 Capa Tours

The tourism industry requires efficient and reliable systems to manage operations such as tour scheduling, reservations, customer data, and payment processing. As companies grow, manual or fragmented systems can lead to inefficiencies, errors, and poor user experiences. Capa Tours is a comprehensive tourism management system designed to streamline these processes through a secure, intuitive, and centralized platform. It enables administrators to manage tours, clients, reservations, and payments in real time, while providing customers with a seamless experience to explore destinations, book tours, and complete payments. By integrating these core functionalities into a single system, Capa Tours improves operational efficiency, reduces administrative workload, and enhances customer satisfaction.

## ✨ Features

### 🛠️ Admin Panel
- 🚍 **Tour Management:**
    - 📋 View all tours with status indicators (Pending, In Progress, Completed).
    - ✏️ Edit and update tour information.
    - ❌ Deactivate unavailable or outdated tours.
    - 🖼️ Upload images for each tour.
- 👥 **Client Management:**
    - 📋 View registered clients and their basic information.
    - 🚫 Deactivate inactive or unused accounts.
- 📅 **Reservations Management:**
    - 📋 View all reservations with detailed information.
    - 💵 Access payment details for each reservation.
    - ❌ Manually cancel reservations in "Pending" status.

### 👤 Client Features
- 🔐 **Authentication:**
    - 🔑 Secure login with email and password.
    - 📄 User registration with validation.
    - 📩 Password recovery via email.
- 🌎 **Tour Exploration:**
    - 🏠 Landing page with featured tours.
    - 📋 Browse tours with filters (price, destination).
    - 📖 View detailed tour information, including ratings and reviews.
- 📅 **Reservations & Payments:**
    - 📝 Book tours by selecting date and number of participants.
    - 📊 Track reservation statuses (Pending, Confirmed, Canceled, Completed).
    - 📤 Upload payment receipts and receive invoices via email.
- ⭐ **Reviews & Ratings:**
    - 💬 Leave ratings (1–5) and comments on completed tours.
    - 👀 View reviews from other users.

## 🛠️ Technologies Used

- 🎨 **Frontend**: CSS, HTML, Javascript, scss
- 💻 **Backend**: C#
- 🧱 **Frameworks**: ASP.NET Core, Bootstrap
- 🗄️ **Database**: Microsoft SQL Server
- 🌐 **Server**: IIS Express
- 🔂 **Version Control**: Git

## ⚙️ Installation

### 📋 Prerequisites

- 🗄️ [SQL Server Management Studio 2022](https://learn.microsoft.com/en-us/ssms/install/install)
- 🖥️ [Visual Studio 2022](https://visualstudio.microsoft.com/es/downloads/)

### 🔧 Setup

1. 📥 Clone the repository: 

    ```bash
    git clone https://github.com/Crisrod0912/CapaTours.git
    ```

2. 🗃️ Set up the Microsoft SQL Server database:

   - Open **SQL Server Management Studio**.
   - Create a new database called `CapaTours`.
   - Import the provided SQL file `CapaTours.sql` into the `CapaTours` database using your server.

3. ⚙️ Configure the project:

    ```appsettings.json (Web API)

    "ConnectionStrings": {
      "BDConnection": "Server=your_server;Database=CapaTours;Trusted_Connection=True;TrustServerCertificate=True"
    },

    ```

4. ▶️ Run the project:

    - Open the solution in **Visual Studio 2022**.
    - Run both the MVC and Web API projects using "HTTPS".

5. 🌐 Access the application in your browser.
