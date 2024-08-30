#!/usr/bin/python3
#
# coding: utf-8
#

import asyncio

"""
There are a few options to achieve the same result:

4==  will indent the current line, and the next three.
=ap  will indent Around the current Paragraph. Having no empty lines, this method qualifies as a paragraph.
=%   will indent to the the end of the method. Note this implies the use of the matchit plugin. But % works with common curly brace blocks, parens, etc out of the box.
V3j= will do a visual select on the current line and the three below and apply indenting to them.
"""

async def main():
    print('Hello ...')
    await asyncio.sleep(1, result = 'asyncio sleep 1 second')
    print('... world!')

asyncio.run(main())

