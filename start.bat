@echo off
echo PathFinder running at http://localhost:5500  (Ctrl+C to stop)
start http://localhost:5500
python -m http.server 5500
