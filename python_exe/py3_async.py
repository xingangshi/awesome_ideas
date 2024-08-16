#!/usr/bin/python3
#
# coding: utf-8
#

import asyncio

async def main():
    print('Hello ...')
    await asyncio.sleep(1, result = 'asyncio sleep 1 second')
    print('... world!')

asyncio.run(main())

