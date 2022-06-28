#!/usr/bin/env python3

import iterm2

async def main(connection):
    app = await iterm2.async_get_app(connection)

    @iterm2.RPC
    async def clear_all_sessions():
        code = b'\x1b' + b']1337;ClearScrollback' + b'\x07'
        for window in app.windows:
            for tab in window.tabs:
                for session in tab.sessions:
                    await session.async_inject(code)
    await clear_all_sessions.async_register(connection)

iterm2.run_forever(main)
