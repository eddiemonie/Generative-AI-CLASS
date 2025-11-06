Codebase Genius

An autonomous multi-agent documentation system — built by Eddie using JacLang.

Codebase Genius is my personal AI project that automatically analyzes software repositories and generates clean, well-structured Markdown documentation — completely powered by JacLang agents.

Overview

Codebase Genius is designed to make documentation effortless.
It intelligently clones a GitHub repository, analyzes the source code, maps internal relationships, and produces structured documentation — all without manual writing.

This project demonstrates how JacLang’s agentic architecture can be used to build autonomous systems that reason over complex codebases.

Project Structure
codebase_genius/
│
├── agents/
│   ├── supervisor.jac        # Central orchestrator that runs all tasks
│   ├── repo_mapper.jac       # Clones the repository and maps file structure
│   ├── code_analyzer.jac     # Builds contextual code graphs (CCG)
│   └── doc_genie.jac         # Generates final Markdown documentation
│
├── utils/
│   └── parser_utils.py       # Python helpers for parsing and tree-sitter integration
│
├── outputs/                  # Auto-generated documentation output
│
├── main.jac                  # Entry point of the Jac backend
├── requirements.txt          # Project dependencies
└── README.md                 # You are here 
Setup Instructions
Create the project
mkdir codebase_genius && cd codebase_genius

Set up folders
mkdir -p agents utils outputs

Initialize a Python virtual environment
python3 -m venv venv
source venv/bin/activate

Install dependencies
pip install jaclang gitpython tree_sitter openai markdownify

Add API credentials

Create a .env file and add your API key:

echo "OPENAI_API_KEY=your_api_key_here" > .env


(You can also use GEMINI_API_KEY if using Google Gemini.)

Verify your JacLang installation
jac --version

Running Codebase Genius

Start the Jac backend:

jac serve main.jac


Then test it with:

curl -X POST http://localhost:8000/run \
-H "Content-Type: application/json" \
-d '{"repo_url": "https://github.com/example/repo"}'


This triggers the Supervisor walker, which coordinates:

Repo Mapper

Code Analyzer

DocGenie

Generated documentation will appear inside the outputs/ folder.
Agent Breakdown
Agent	Purpose	Key Responsibilities
Supervisor (Code Genius)	Controls overall workflow	run_workflow(), coordinate_agents()
Repo Mapper	Clones and scans repo	clone_repo(), map_structure()
Code Analyzer	Builds the Code Context Graph (CCG)	parse_code(), build_graph()
DocGenie	Produces markdown documentation	generate_docs(), format_sections()
Example Output

A generated markdown file (in outputs/docs.md) looks like this:


This repository provides a RESTful API for machine learning model training.


- main.py
- models/
- utils/
- config/

