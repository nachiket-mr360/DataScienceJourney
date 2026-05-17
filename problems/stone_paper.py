# save this file as app.py
# run using: streamlit run app.py

import streamlit as st
import random

# -------------------------------
# original game logic variables
# -------------------------------
if "com_won" not in st.session_state:
    st.session_state.com_won = 0

if "user_won" not in st.session_state:
    st.session_state.user_won = 0

if "game_over" not in st.session_state:
    st.session_state.game_over = False

if "message" not in st.session_state:
    st.session_state.message = ""

if "com_choice" not in st.session_state:
    st.session_state.com_choice = ""

# -------------------------------
# UI
# -------------------------------
st.set_page_config(page_title="Stone Paper Scissors", page_icon="🎮")

st.title("🎮 Stone Paper Scissors")
st.write("First to score 5 points wins the match.")

st.subheader(
    f"📊 Current Score\n\nComputer : {st.session_state.com_won} | You : {st.session_state.user_won}"
)

# -------------------------------
# choice names
# -------------------------------
choices = {
    1: "🪨 Stone",
    2: "📄 Paper",
    3: "✂️ Scissors"
}

# -------------------------------
# user input buttons
# -------------------------------
col1, col2, col3 = st.columns(3)

user = None

with col1:
    if st.button("🪨 Stone"):
        user = 1

with col2:
    if st.button("📄 Paper"):
        user = 2

with col3:
    if st.button("✂️ Scissors"):
        user = 3

# -------------------------------
# original logic
# -------------------------------
if user and not st.session_state.game_over:

    com = random.randint(1,3)

    st.session_state.com_choice = choices[com]

    if user ==1 and com ==3 or user == 3 and com ==2 or user ==2 and com == 1:
        st.session_state.message = "✅ You won the round"
        st.session_state.user_won +=1

    elif com ==1 and user == 3 or com==3 and user ==2 or com==2 and user==1:
        st.session_state.message = "❌ Computer won the round"
        st.session_state.com_won +=1

    elif user == com:
        st.session_state.message = "🤝 This round is draw"

    # game winner
    if st.session_state.com_won == 5 or st.session_state.user_won == 5:
        st.session_state.game_over = True

# -------------------------------
# results display
# -------------------------------
if st.session_state.com_choice:
    st.write(f"💻 Computer chose: {st.session_state.com_choice}")

if st.session_state.message:
    st.success(st.session_state.message)

# -------------------------------
# final winner
# -------------------------------
if st.session_state.game_over:

    if st.session_state.com_won > st.session_state.user_won:
        st.error("🏆 Computer won the game")

    else:
        st.balloons()
        st.success("🏆 You won the game")

    # restart button
    if st.button("🔄 Play Again"):
        st.session_state.com_won = 0
        st.session_state.user_won = 0
        st.session_state.game_over = False
        st.session_state.message = ""
        st.session_state.com_choice = ""
        st.rerun()