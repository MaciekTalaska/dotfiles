#! /usr/bin/env bash

clean_font_cache() {
  echo "clean font cache... (this may take a while)"
  fc-cache -f
}

"$@"
