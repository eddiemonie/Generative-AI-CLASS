# 🧠 Codebase Genius
Autonomous multi-agent documentation generator built with **JacLang**.

---

## 🚀 Overview
Codebase Genius is an AI-powered system that analyzes any public GitHub repository and produces high-quality Markdown documentation. It leverages **JacLang** agents (walkers) to coordinate repository mapping, code analysis, and documentation synthesis.

---

## 🧱 Project Structure
```
codebase_genius/
│
├── agents/
│   ├── supervisor.jac        # Supervisor agent (workflow orchestrator)
│   ├── repo_mapper.jac       # Clones repo and maps structure
│   ├── code_analyzer.jac     # Parses code and builds context graph
│   └── doc_genie.jac         # Generates markdown documentation
│
├── utils/
│   └── parser_utils.py       # Tree-sitter/AST parsing helpers
│
├── outputs/                  # Generated markdown files
│
├── main.jac                  # Entry point for Jac backend
├── requirements.txt          # Python dependencies
└── README.md                 # Setup and usage instructions
```

---

## ⚙️ Setup Instructions

### 1️⃣ Clone or create the project
```bash
mkdir codebase_genius && cd codebase_genius
```

### 2️⃣ Create project folders
```bash
mkdir -p agents utils outputs
```

### 3️⃣ Create virtual environment and activate
```bash
python3 -m venv venv
source venv/bin/activate
```

### 4️⃣ Install dependencies
```bash
pip install jaclang gitpython tree_sitter openai markdownify
```

### 5️⃣ Create a `.env` file for API keys
```bash
echo "OPENAI_API_KEY=your_api_key_here" > .env
# or use GEMINI_API_KEY if you’re using Google Gemini
```

### 6️⃣ Verify installation
```bash
jac --version
```

---

## 🧰 Running the Backend

To launch the backend server:
```bash
jac serve main.jac
```

### Test with curl:
```bash
curl -X POST http://localhost:8000/run -H "Content-Type: application/json" -d '{"repo_url": "https://github.com/example/repo"}'
```

This will start the **Supervisor walker** that triggers Repo Mapper → Code Analyzer → DocGenie. The output will be generated in `outputs/`.

---

## 📦 Packaging the Project (ZIP)
To package your project for submission or sharing:
```bash
cd ..
zip -r codebase_genius.zip codebase_genius
```
This produces `codebase_genius.zip` containing all files.

---

## 🧩 Agent Overview

| Agent | Role | Key Abilities |
|--------|------|---------------|
| **Code Genius (Supervisor)** | Orchestrates workflow, manages repo processing order | `run_workflow`, `coordinate_agents` |
| **Repo Mapper** | Clones repository and builds file-tree map | `clone_repo`, `map_structure`, `summarize_readme` |
| **Code Analyzer** | Builds Code Context Graph (CCG), links functions/classes | `parse_code`, `build_graph`, `analyze_relations` |
| **DocGenie** | Synthesizes final markdown docs | `generate_docs`, `format_sections`, `insert_diagrams` |

---

## 📄 Example Output

Example markdown file generated under `outputs/sample_repo/docs.md`:
```markdown
# Sample Repository Documentation

## Overview
This project provides an API for machine learning model training.

## File Structure
- main.py
- models/
- utils/

## API Reference
### train_model()
Trains the model on given dataset.

### evaluate_model()
Evaluates model accuracy on test data.
```

---

## 🧠 Tips for Enhancement
- Integrate `tree_sitter` grammars for advanced AST parsing.
- Add Streamlit front-end for visualization.
- Extend support to JavaScript and TypeScript repos.
- Generate relationship diagrams automatically via Graphviz or Mermaid.

---

## 🧾 License
MIT License © 2025 Codebase Genius Team
