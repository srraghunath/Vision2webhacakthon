#!/usr/bin/env bash
echo "PathFinder running at http://localhost:5500  (Ctrl+C to stop)"
(sleep 1; command -v open >/dev/null && open http://localhost:5500 || command -v xdg-open >/dev/null && xdg-open http://localhost:5500) &
python3 -m http.server 5500
