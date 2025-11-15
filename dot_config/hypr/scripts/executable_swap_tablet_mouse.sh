#!/usr/bin/env bash

JSON_FILE=~/.config/OpenTabletDriver/settings.json

jq ' ( .Profiles[0].Filters[] 
  | select(.Path == "MouseUtils.Abs2Rel.Abs2RelFilter")
  | .Enable ) |= not
' "$JSON_FILE" > "$JSON_FILE.tmp" && mv "$JSON_FILE.tmp" "$JSON_FILE"

otd loadsettings $JSON_FILE
