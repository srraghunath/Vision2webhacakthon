# PathFinder — run locally with a Qwen model

PathFinder is one page (`index.html`) plus a small `vendor/` folder with the PDF and Word readers. No build step, no npm. The only optional
extra is a local AI model through Ollama, used for the mock interview, resume review,
research emails and the check-in chatbot. Without it those features use built-in
rule-based fallbacks, so the app always works.






## What is new: dashboard guidance, mentorship removed

- **Thought for today**: a rotating real quote or research-backed fact (with its source), plus a "CGPA matters, and it is not everything" card that uses your CGPA and the sample company cut-offs.
- **What an ideal student completes this year**: a tick-off checklist for each year (1st to 4th), grouped by academics, technical skills, projects, internships and habits. Every item has specific material to use (courses, LeetCode / HackerRank / GeeksforGeeks modules, docs, job boards).
- The Mentorship page was removed. Alumni cards keep the Gmail draft, LinkedIn and GitHub buttons, and professors' projects remain under Professors.

## What is new: the trail map (Roadmap > Trail map)

An illustrated path for every year (1st to 4th), like the dashboard scene. Tap a point on the path and it opens into its steps; each step links to a specific site or material (LeetCode Explore cards and study plans, HackerRank Interview Preparation Kit, GeeksforGeeks tutorials, courses, docs, job boards). Steps tick off, the path fills in as you progress, and a pin shows where you are. Some steps adapt to you (your weakest DSA topics, missing role skills, live openings). Every step has an outside link; check a few before demos, since websites change.

## What is new: guidance-first roadmap, professors, alumni contact

**Roadmap is now the home of the app** (opens first).
- 12 weeks, week by week, with a week strip, a "Next best action" card and per-task progress.
- Every task has a numbered **path**: exact steps plus links. DSA tasks name the specific module on your chosen platform, for example LeetCode Explore cards and Top Interview 150 sections, HackerRank Interview Preparation Kit playlists, GeeksforGeeks tutorials. Skill tasks link to courses and docs.
- **Customise** (button on the roadmap): goal (research, internship, placement, open source, higher studies, building), hours per week, DSA level, practice platform, how much of each kind of task, busy weeks, your own tasks, move or hide any task, add notes.
- **Openings and progress** tab: every research internship, fellowship, internship, hackathon and workshop open today that you can apply to, with your preparation progress and tracker stage.

**Professors** (Find > Professors): projects, papers and events by professors. Ask to join, RSVP, track requests, add an accepted project to your roadmap. A "For professors" demo tab lets a professor post items and accept requests.

**Alumni** cards now include a pre-filled Gmail draft, LinkedIn and GitHub searches, copy message, and a contacted marker. The account menu and Profile page have quick links to Gmail, LinkedIn, GitHub, LeetCode, HackerRank, GeeksforGeeks and Kaggle.

## What is new: detailed roadmap and live opportunities

**Roadmap** (My Roadmap page): a 12-week plan, week by week, sized to your hours per week.
- Every task explains why it is there, the exact steps, and when it is done, with a tick box that saves your progress.
- It is built from your data: weakest or not-started DSA topics (with named patterns and practice problems), missing skills for your target role, your resume score, GSoC stage, interview report, and the openings that are live now (application tasks are placed in the week before each deadline).
- Tabs: This week, Weeks 1-4, 5-8, 9-12, and Alumni path (what alumni like you did, year by year). Each phase shows milestones and an alumni example.

**Opportunities** (Opportunities page): shows what is open on today's date (sample data), with status tiles: Open now, Closing this week, Opening soon, Closed.
- "How to prepare" opens a dated step-by-step plan for that opportunity, a documents checklist with tips, skills gap, what selectors look for, common mistakes, and alumni who did something similar.
- Progress is saved and feeds the tracker.

**Alumni** cards now include a full year-by-year playbook, lessons and what to skip.

## What is new: advanced resume and interview

**Resume analyzer** (Resume page)
- Upload a **PDF, Word (.docx) or text** file, or drag it onto the page. Files are read in the browser and never uploaded.
  PDF and Word readers live in `vendor/`, so this works offline. Scanned (image-only) PDFs cannot be read; export a text PDF from Word or Google Docs.
- Parses your sections, contact details, skills (about 100 recognised skills) and every bullet; scores each bullet for action verb, number, tools and vague wording.
- Six weighted scores, a prioritised "fix these first" list, ATS checklist, skills and keyword gaps against the job description and target role, score history.
- Optional AI review (summary, gaps and before/after rewrites) using your local Qwen model.

**Mock interview** (Mock Interview page)
- Choose company, role, round type (full loop, technical, project deep-dive, HR), difficulty and number of questions.
- About 60 curated questions across roles plus questions built from your own projects, resume claims and the company's focus areas.
- Follow-ups adapt to your answer (the local model writes a sharp follow-up; a rule-based one is used if AI is off). Difficulty adapts as you go.
- Every answer is scored against a rubric of key ideas, structure, numbers, trade-offs, filler words and the STAR method.
- The report shows an overall score, radar chart, delivery stats (words, time, fillers, metrics), question-by-question review with a model outline, insights, history across sessions and a one-click drill on your weakest area.
- Optional: dictate answers (Chrome) and hear questions read aloud.

## 1. Install Ollama and a Qwen model (one time)

1. Install Ollama from https://ollama.com/download and start it (the desktop app runs a
   server at http://localhost:11434 automatically).
2. Open a terminal and pull a model:

   ```bash
   ollama pull qwen2.5:7b     # about 4.7 GB, good quality, wants ~8 GB free RAM
   # lighter laptops:
   ollama pull qwen2.5:3b     # about 1.9 GB, faster, simpler answers
   ```
3. Check it answers: `ollama run qwen2.5:7b "Say hello"`

## 2. Open the project in VS Code

1. Unzip `pathfinder-local.zip`.
2. VS Code: **File → Open Folder…** and choose the `pathfinder-local` folder.
3. Accept the popup "Do you want to install the recommended extensions?" (it installs
   **Live Server** by Ritwick Dey). Or install it manually from the Extensions panel
   (Ctrl+Shift+X).
4. Open `index.html`, then right-click → **Open with Live Server**
   (or click **Go Live** in the bottom-right status bar).
5. The browser opens at http://127.0.0.1:5500/index.html.

No Live Server? Use the terminal in VS Code (Ctrl+`):

```bash
python -m http.server 5500      # Windows: python, macOS/Linux: python3
```
then open http://localhost:5500. `start.bat` / `start.sh` do the same.

Tip: open it through a local address like the above, not by double-clicking the file.
Browsers give file:// pages a restricted origin and Ollama may refuse it.

## 3. Turn on the local model inside the app

1. Click the sliders icon (top-right) → **AI model**.
2. Choose **Local (Ollama)** (or **Auto**, which uses Ollama when it is reachable).
3. Keep the address `http://localhost:11434`, set **Model** to `qwen2.5:7b`
   (or whatever you pulled), click **Test connection**. You should see
   "Connected. Model … is ready."
4. Use it: **Mock Interview → Start interview**, **Resume → Analyze → Get AI review**,
   **Research → Email assistant**, **Ask PathFinder** chat. Each page shows an
   `AI: local · qwen2.5:7b` badge; click it to change settings.

Local models take a few seconds per reply (longer on CPU only). The resume score,
eligibility, rankings and roadmap are computed by fixed rules; the model only writes
text, questions and feedback. Feedback is practice feedback, not a company evaluation.

## Troubleshooting

| Problem | Fix |
|---|---|
| "Cannot reach Ollama" | Start the Ollama app, or run `ollama serve`. Check http://localhost:11434 shows "Ollama is running". |
| Browser blocks the request (CORS) | Allow the page origin, then restart Ollama: **Windows** `setx OLLAMA_ORIGINS "*"` (quit and reopen Ollama); **macOS** `launchctl setenv OLLAMA_ORIGINS "*"`; **Linux** `sudo systemctl edit ollama` → add `Environment="OLLAMA_ORIGINS=*"` → `sudo systemctl restart ollama`. |
| "model … is not installed" | `ollama pull qwen2.5:7b` (or change the Model field to one you have). |
| Very slow or out of memory | Use `qwen2.5:3b`, close other apps. |
| Odd or malformed answers | The app validates model output and falls back to the rule-based version automatically. A larger model (e.g. `qwen2.5:14b`) is more reliable. |
| Want to start over | Account menu (avatar) → Reset demo data. Data is stored in your browser's local storage for the address you used, so use the same address each time. |

## Editing the sample data

Everything is in `index.html`. Search for these constants and replace the sample
records with real ones: `OPPS` (opportunities), `PROFS` (professors), `GSOC_ORGS`,
`COMPANIES` (eligibility and rounds), `ALUMNI`, `SEED_BOARD`, `PROBLEMS` (contest).
All organisations, professors, companies and alumni shipped here are fictional samples.

## Next step for a real deployment

Shared data (users, contests, leaderboards, alumni submissions) needs a backend
(FastAPI + PostgreSQL) and a sandboxed code judge; this prototype keeps everything in
the browser.
