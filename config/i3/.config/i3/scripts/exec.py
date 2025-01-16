#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import i3pie

ARGS = sys.argv[1:]

KEY = "moniere - Google Chrome"

with i3pie.Connection() as i3:
    tree = i3.get_tree()
    focused = tree.focused_window()

    if focused and not focused.window_title.startswith(KEY):
        # This is not the VM window
        focused.command(" ".join(ARGS))

def test(a: str, b: int) -> int:

    return int(a)

test("a",5)

import logging

logging.getLogger("a").setLevel(logging.CRITICAL)
