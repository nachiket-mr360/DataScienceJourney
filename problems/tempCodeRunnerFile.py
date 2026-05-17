import tkinter as tk
import random

# Main window
root = tk.Tk()
root.title("Stone Paper Scissors")
root.geometry("500x400")
root.config(bg="#1e1e1e")

# Scores
user_score = 0
computer_score = 0

choices = {
    1: "Stone",
    2: "Paper",
    3: "Scissors"
}

# Result function
def play(user_choice):
    global user_score, computer_score

    computer_choice = random.randint(1, 3)

    user_text = choices[user_choice]
    com_text = choices[computer_choice]

    user_choice_label.config(text=f"You chose: {user_text}")
    computer_choice_label.config(text=f"Computer chose: {com_text}")

    # Winning logic
    if user_choice == computer_choice:
        result = "Draw Round!"
    
    elif (
        (user_choice == 1 and computer_choice == 3) or
        (user_choice == 2 and computer_choice == 1) or
        (user_choice == 3 and computer_choice == 2)
    ):
        user_score += 1
        result = "You Won This Round!"
    
    else:
        computer_score += 1
        result = "Computer Won This Round!"

    result_label.config(text=result)

    score_label.config(
        text=f"Your Score: {user_score}   |   Computer Score: {computer_score}"
    )

    # Match winner
    if user_score == 5:
        result_label.config(text="🎉 YOU WON THE MATCH 🎉")
        disable_buttons()

    elif computer_score == 5:
        result_label.config(text="💀 COMPUTER WON THE MATCH 💀")
        disable_buttons()

# Disable buttons after game ends
def disable_buttons():
    stone_btn.config(state="disabled")
    paper_btn.config(state="disabled")
    scissors_btn.config(state="disabled")

# Restart game
def restart_game():
    global user_score, computer_score

    user_score = 0
    computer_score = 0

    score_label.config(text="Your Score: 0   |   Computer Score: 0")
    result_label.config(text="Choose Your Move")
    user_choice_label.config(text="")
    computer_choice_label.config(text="")

    stone_btn.config(state="normal")
    paper_btn.config(state="normal")
    scissors_btn.config(state="normal")

# Title
title = tk.Label(
    root,
    text="STONE PAPER SCISSORS",
    font=("Arial", 22, "bold"),
    bg="#1e1e1e",
    fg="cyan"
)
title.pack(pady=20)

# Score label
score_label = tk.Label(
    root,
    text="Your Score: 0   |   Computer Score: 0",
    font=("Arial", 14),
    bg="#1e1e1e",
    fg="white"
)
score_label.pack(pady=10)

# Result label
result_label = tk.Label(
    root,
    text="Choose Your Move",
    font=("Arial", 16, "bold"),
    bg="#1e1e1e",
    fg="yellow"
)
result_label.pack(pady=15)

# Choice labels
user_choice_label = tk.Label(
    root,
    text="",
    font=("Arial", 12),
    bg="#1e1e1e",
    fg="lightgreen"
)
user_choice_label.pack()

computer_choice_label = tk.Label(
    root,
    text="",
    font=("Arial", 12),
    bg="#1e1e1e",
    fg="orange"
)
computer_choice_label.pack()

# Buttons frame
button_frame = tk.Frame(root, bg="#1e1e1e")
button_frame.pack(pady=30)

# Buttons
stone_btn = tk.Button(
    button_frame,
    text="🪨 Stone",
    font=("Arial", 14),
    width=12,
    command=lambda: play(1)
)
stone_btn.grid(row=0, column=0, padx=10)

paper_btn = tk.Button(
    button_frame,
    text="📄 Paper",
    font=("Arial", 14),
    width=12,
    command=lambda: play(2)
)
paper_btn.grid(row=0, column=1, padx=10)

scissors_btn = tk.Button(
    button_frame,
    text="✂ Scissors",
    font=("Arial", 14),
    width=12,
    command=lambda: play(3)
)
scissors_btn.grid(row=0, column=2, padx=10)

# Restart button
restart_btn = tk.Button(
    root,
    text="Restart Game",
    font=("Arial", 12, "bold"),
    bg="red",
    fg="white",
    command=restart_game
)
restart_btn.pack(pady=20)

# Run app
root.mainloop()