</p>
<p align="center">
    <h1 align="center">Azure Infrastructure Deployment for RAG Chatbot 🤖</h1>
</p>

<br>
<br>



<p align="Center">
    <em> Technology Stack </em>
</p>
<p align="center">
	<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25?logo=gnubash&logoColor=fff&style=flat-square" alt="GNU%20Bash">
	<img src="https://img.shields.io/badge/Streamlit-FF4B4B.svg?style=flat&logo=Streamlit&logoColor=white" alt="Streamlit">
	<img src="https://img.shields.io/badge/YAML-CB171E.svg?style=flat&logo=YAML&logoColor=white" alt="YAML">
	<img src="https://img.shields.io/badge/OpenAI-412991.svg?style=flat&logo=OpenAI&logoColor=white" alt="OpenAI">
	<br>
	<img src="https://img.shields.io/badge/GitHub%20Actions-2088FF.svg?style=flat&logo=GitHub-Actions&logoColor=white" alt="GitHub%20Actions">
  <img src="https://img.shields.io/badge/Python-3776AB.svg?style=flat&logo=Python&logoColor=white" alt="Python">
	<img src="https://img.shields.io/badge/terraform-%235835CC.svg?style=flat&logo=terraform&logoColor=white" alt="Terraform" >
	<img src="https://img.shields.io/badge/FastAPI-009688.svg?style=flat&logo=FastAPI&logoColor=white" alt="FastAPI">
	<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON"></p>
</div>
<hr>


#### 🔗 Quick Links

- [📍 Overview](#-overview)
- [✨Features](#-features)
- [📂 Project Structure](#-project-structure)
- [🚀 Getting Started](#-getting-started)
    - [🔖 Prerequisites](#-prerequisites)
    - [📦 Installation](#-installation)
    - [🤖 Usage](#-usage)
- [ ⚖ License](#-license)


<br>
<br>
<br>

## 📍 Overview
This project establishes a scalable, secure, and automated web application infrastructure on Microsoft Azure. Utilizing Terraform modules and Ansible, the deployment and management of cloud resources are streamlined, ensuring efficiency and reliability. GitHub Actions further enhances automation by keeping VM instances consistently updated, reducing manual intervention.
At the core of this web application is an advanced Retrieval-Augmented Generation (RAG) chatbot, designed to analyze user-uploaded files and generate contextually relevant responses. By integrating cloud automation with AI-driven intelligence, this project optimizes operational efficiency, enhances data processing capabilities, and improves user interactions.

<br>
<br>

---

## **✨ Features**  

|    |   Feature         | Description |
|----|-------------------|---------------------------------------------------------------|
| ⚙️  | **Architecture**  | The project follows a modular approach, ensuring a clear separation of concerns. Infrastructure automation is implemented using **Terraform modules** and **Ansible**, enabling seamless provisioning of resources on **Azure**. The **Terraform directory** consists of structured modules for VM instances, networking, storage, and security, supporting scalability and maintainability. |
| 🔩 | **Code Quality**  | The codebase maintains high standards, adhering to **PEP 8** and best practices for readability and maintainability. Continuous integration with **GitHub Actions** ensures automated testing and updates. |
| 📄 | **Documentation** | Comprehensive documentation covers infrastructure setup, usage, and contribution guidelines. Detailed API references and examples assist in deployment and development. |
| 🔌 | **Integrations**  | The project integrates **Terraform**, **Ansible**, and **GitHub Actions** for cloud automation. The **RAG-powered chatbot** enhances user interactions by analyzing uploaded files, making responses data-driven and context-aware. |
| 🧩 | **Modularity**    | The **Terraform directory** is structured into distinct modules, such as **VM**, **VMSS**, **Vnet**, **Gateway**, **Storage**, and **Database**, ensuring reusability and clear interfaces. This modular design allows for independent configuration and scalability. |
| 📦 | **Dependencies**  | Key dependencies include **Terraform**, **Ansible**, **GitHub Actions**, and various AI libraries for intelligent data processing. |

---

 
## **📂 Project Structure**
```sh
.
├── Terraform
│   ├── Setup_Scripts
│   ├── modules
│   │   ├── BH
│   │   ├── Gateway
│   │   ├── KV
│   │   ├── VM
│   │   ├── VMSS
│   │   ├── Vnet
│   │   ├── db
│   │   └── storage
│   ├── data.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variables.tf
├── backend.py
├── chatbot.py
├── requirements.txt
└── update_app.sh
```

## 🚀 Getting Started

### 🔖 Prerequisites  

Before proceeding with the setup, ensure you have the following:  

- An active **Azure Subscription**  
- **Azure CLI** authenticated to your account  
- **Terraform** installed on your system  
- **Ansible** installed for configuration management  
- **WSL** or a **Linux-based system** for execution  
- An active **GitHub account** for version control and automation
  <br>
  
> [!Note]
>  For detailed setup instructions, refer to the [Wiki](<YOUR_WIKI_URL_HERE>).  

<br>

### 📦 Installation

Build the project from source:

1. Clone the ChatBotApp-Azure-Infra repository:
```sh
❯ git clone https://github.com/XxrzxX/ChatBotApp-Azure-Infra
```

2. Navigate to the project directory:
```sh
❯ cd ChatBotApp-Azure-Infra
```

3. Install the required dependencies:
   
🔗 [Terraform Installation Guide](https://developer.hashicorp.com/terraform/install)  
🔗 [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)  
🔗 [Azure CLI Installation Guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) 

<br>

### 🤖 Usage

To run setup project infrustucutre , execute the following command:
```sh
❯ cd Terraform  
❯ terraform init  
❯ terraform validate  
❯ terraform plan  
❯ terraform apply 
```

## ⚖ License  

This project is licensed under the **MIT License**.  

For more details, see the [LICENSE](./LICENSE) file.  

