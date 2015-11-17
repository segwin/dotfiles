#!/bin/sh

THEIRS=${6}
MINE=${7}

#vimdiff $MINE $THEIRS -c ":diffthis" -c "wincmd W | setl stl=THEIRS | wincmd W | setl stl=MINE"
vimdiff $MINE $THEIRS
