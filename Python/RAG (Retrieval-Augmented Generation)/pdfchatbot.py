import streamlit as st
from PyPDF2 import PdfReader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_groq import ChatGroq

from langchain_community.embeddings import HuggingFaceEmbeddings # For open-source embeddings

from langchain_community.vectorstores import FAISS
from langchain_classic.chains.question_answering import load_qa_chain

# --- API KEY & ENV HANDLING ---
# Import for loading .env file (recommended for API keys)
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# --- Configuration for GROQ AI ---
# Get GROQ AI API key from environment variable
# IMPORTANT: Store your token in a file named .env in the same directory as this script.
# The .env file should contain: GROQ_API_KEY="sk-tg-YOUR_ACTUAL_GROQ_AI_TOKEN_HERE"
GROQ_API_KEY = os.getenv("GROQ_API_KEY")

# Define the GROQ AI model you want to use for the LLM
# You can find models at https://www.groq.com/models
# Recommended instruction-tuned models for Q&A:
# "mistralai/Mixtral-8x7B-Instruct-v0.1" (Very powerful, might be slower)
# "google/gemma-7b-it" (Good balance, faster)
# "meta-llama/Llama-3.3-70B-Instruct-Turbo" (Requires Meta's Llama access via Hugging Face)
GROQ_MODEL_ID = "meta-llama/Llama-3.3-70B-Instruct-Turbo" # You can change this model ID


# --- Error Handling for Missing API Key ---
if not GROQ_API_KEY:
    st.error("Error: GROQ AI API key not found.")
    st.info("Please create a .env file in your project directory with GROQ_API_KEY=\"sk-tg-YOUR_ACTUAL_GROQ_AI_TOKEN_HERE\".")
    st.stop() # Stop the Streamlit app if the token is missing


st.header("My first Chatbot")


with st.sidebar:
    st.title("Your Documents")
    file = st.file_uploader("Upload a PDF file and start asking questions", type="pdf")


# Extract the text and process if a file is uploaded
if file is not None:
    pdf_reader = PdfReader(file)
    text = ""
    for page in pdf_reader.pages:
        text += page.extract_text()

    # Break it into chunks
    text_splitter = RecursiveCharacterTextSplitter(
        separators="\n",
        chunk_size=500,
        chunk_overlap=100,
        length_function=len
    )
    chunks = text_splitter.split_text(text)

    # --- Generating Embeddings ---
    # Using a general-purpose sentence transformer for embeddings
    # This model will be downloaded locally by sentence-transformers library on first run.
    embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

    # Creating vector store - FAISS
    vector_store = FAISS.from_texts(chunks, embeddings)

    # Get user question
    user_question = st.text_input("Type Your question here")

    # Do similarity search and get response if user asks a question
    if user_question:
        match = vector_store.similarity_search(user_question)

        # --- Define the LLM ---
        llm = ChatGroq(
            model_name='llama-3.1-8b-instant', 
            api_key=os.getenv("GROQ_API_KEY"), # Pass the GROQ AI API key
            temperature=0.1, # Controls randomness: 0.0 for deterministic, higher for more creative
            max_tokens=500 # Max number of tokens to generate in the response
        )

        # Output results
        # chain -> take the question, get relevant document, pass it to the LLM, generate the output
        chain = load_qa_chain(llm, chain_type="stuff")
        response = chain.run(input_documents = match, question = user_question)
        st.write(response)