#!/bin/bash

printf "Changing mouse size...\n"
xrdb -merge <<< "Xcursor.size: 24"

printf "Showing the mouse size...\n"
xrdb -query | grep Xcursor.size