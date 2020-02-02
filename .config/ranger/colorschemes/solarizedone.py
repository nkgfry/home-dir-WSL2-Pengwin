# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.
# Author: Joseph Tannhuber <sepp.tannhuber@yahoo.de>, 2013
# Solarized like colorscheme, similar to solarized-dircolors
# from https://github.com/seebi/dircolors-solarized.
# This is a modification of Roman Zimbelmann's default colorscheme.

from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    cyan, magenta, red, white, default,
    normal, bold, reverse,
    default_colors,
)


class Solarized(ColorScheme):
    # progress_bar_color = 33
    progress_bar_color = 32

    def use(self, context):  # pylint: disable=too-many-branches,too-many-statements
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            # Old value
            # fg = 244
            fg = default
            if context.selected:
                attr = reverse
                # old value
                # bg = default
                # because of attr = reverse, this affects the highlight for regular selected files
                fg = 244
            else:
                attr = normal
            if context.empty or context.error:
                fg = 235
                # bg = 160
                bg = default
            if context.border:
                fg = default
            if context.media:
                if context.image:
                    fg = 136
                else:
                    fg = 166
            if context.container:
                fg = 61
            if context.directory:
                # Directory colors
                # fg = 33
                fg = 32
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                fg = 64
                attr |= bold
            if context.socket:
                fg = 136
                bg = 230
                attr |= bold
            if context.fifo:
                fg = 136
                bg = 230
                attr |= bold
            if context.device:
                fg = 244
                bg = 230
                attr |= bold
            if context.link:
                fg = 37 if context.good else 160
                attr |= bold
                if context.bad:
                    bg = 235
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (red, magenta):
                    fg = white
                else:
                    fg = red
            if not context.selected and (context.cut or context.copied):
                # original color very hard to see
                # fg = 234
                fg = 203
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    bg = 237
            if context.badinfo:
                if attr & reverse:
                    bg = magenta
                else:
                    fg = magenta

            if context.inactive_pane:
                fg = 241

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                # Old value
                # fg = 16 if context.bad else 255
                fg = 16 if context.bad else 244
                if context.bad:
                    bg = 166
            elif context.directory:
                # Old value
                # fg = 33
                fg = 32
            elif context.tab:
                # Old value
                # fg = 47 if context.good else 33
                fg = 47 if context.good else 32
                bg = 239
            elif context.link:
                fg = cyan

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    # Old value
                    # fg = 93
                    fg = 96
                elif context.bad:
                    fg = 160
                    bg = 235
            if context.marked:
                attr |= bold | reverse
                fg = 237
                bg = 47
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 160
                    bg = 235
            if context.loaded:
                bg = self.progress_bar_color

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 93

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        return fg, bg, attr
