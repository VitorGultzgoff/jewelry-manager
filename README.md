# 💎 Jewelry Manager

Welcome to **Jewelry Manager**, a comprehensive application designed to help jewelry businesses manage their inventory, track sales, connect with customers, and gain actionable insights to expand their reach and optimize business decisions. Whether you're running a boutique or a large-scale jewelry operation, this tool is tailored to empower your business.

---

## ✨ Features

### 🛍️ Inventory Management
- **Track your stock**: Add, update, and organize your jewelry pieces.
- **Categorize items**: Group items by type, collection, or material (e.g., gold, silver, diamonds).
- **Stock alerts**: Get notified when items are running low.

### 📊 Sales Tracking
- **Monitor sales**: Log transactions and view sales performance over time.
- **Reports**: Generate detailed sales reports for better decision-making.
- **Discount management**: Apply and track promotional offers.

### 🤝 Customer Relationship Management (CRM)
- **Customer profiles**: Maintain detailed records of customer purchases and preferences.
- **Engagement tools**: Send follow-ups, thank-you messages, or promotions.
- **Loyalty programs**: Reward repeat customers with points or exclusive offers.

### 📈 Business Insights
- **Dashboard overview**: Access real-time analytics and trends.
- **Customizable reports**: Filter data to see what matters most.
- **Actionable insights**: Identify top-selling items, peak sales periods, and customer demographics.

---

## 🚀 Getting Started

### Prerequisites
Ensure you have the following installed on your system:
- [Node.js](https://nodejs.org/) (v16+)
- [Ruby on Rails](https://rubyonrails.org/) (v7+)
- [PostgreSQL](https://www.postgresql.org/)

### Installation

1. **Clone the repository**:
   ```bash
       git clone https://github.com/yourusername/jewelry-manager.git
       cd jewelry-manager
    ```

2. **Install backend dependencies**:

    ```bash
        bundle install
    ```

3. **Install frontend dependencies**: Navigate to the web-client folder and install the frontend dependencies:

    ```bash
        cd web-client
        npm install
    ```

4. **Set up the database**: From the root of the repository, run:

    ```bash
        cd ..
        rails db:create db:migrate db:seed
    ```

5. **Start the development server**:
 - **Backend**:
    ```bash
    rails server
    ```

 - **Frontend**: Navigate to the web-client folder and run the frontend server:
    ```bash
    cd web-client
    npm run dev

6. **Access the application**: Open your browser and go to `http://localhost:3000`.

## 🛠️ Technologies Used
- **Frontend**: React, TypeScript
- **Backend**: Ruby on Rails, GraphQL API
- **Database**: PostgreSQL
- **Styling**: Material-UI
- **Data Management**: Apollo Client

## 📝 Roadmap
- [ ] Implement advanced search filters 🔍
- [ ] Introduce AI-powered inventory recommendations 🤖


## 🤝 Contributing
We welcome contributions! To get started:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request.

## 🛡️ License
This project is licensed under the **Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)** license.
You are free to:

- **Share**: Copy and redistribute the material in any medium or format.
- **Adapt**: Remix, transform, and build upon the material.
**Under the following terms**:
- **Attribution**: You must give appropriate credit, provide a link to the license, and indicate if changes were made.
- **NonCommercial**: You may not use the material for commercial purposes.
For full license details, visit the [Creative Commons website](https://creativecommons.org/licenses/by-nc/4.0/).

## 📫 Contact
Have questions or suggestions? Feel free to reach out:

- **Email**: vlgultzgoff@gmail.com
- **GitHub Issues**: Create an issue
