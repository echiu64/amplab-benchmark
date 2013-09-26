"""
Adapted from https://gist.github.com/jtriley/1108174
Originally from: http://stackoverflow.com/questions/566746/how-to-get-console-window-width-in-python
"""
import os
import platform
import subprocess
from struct import Struct


def get_terminal_size():
    """Get width and height of console; works on linux, os x, windows and cygwin"""
    current_os = platform.system()
    if current_os == 'Windows':
        size = _get_terminal_size_windows()
        if not size:
            # needed for window's python in cygwin's xterm!
            size = _get_terminal_size_tput()
    elif current_os in ('Linux', 'Darwin') or current_os.startswith('CYGWIN'):
        size = _get_terminal_size_linux()
    if not size:
        size = (80, 25)
    return size

def _get_terminal_size_windows():
    try:
        from ctypes import windll, create_string_buffer
        STDERR_HANDLE = -12
        h = windll.kernel32.GetStdHandle(STDERR_HANDLE)
        csbi_struct = Struct("hhhhHhhhhhh")
        csbi = create_string_buffer(csbi_struct.size)
        res = windll.kernel32.GetConsoleScreenBufferInfo(h, csbi)
        if res:
            _, _, _, _, _, left, top, right, bottom, _, _ = csbi_struct.unpack(csbi.raw)
            return right - left + 1, bottom - top + 1
        return None
    except Exception:
        return None

def _get_terminal_size_tput():
    # get terminal width
    # src: http://stackoverflow.com/questions/263890/how-do-i-find-the-width-height-of-a-terminal-window
    try:
        cols = int(subprocess.check_call(['tput', 'cols']))
        rows = int(subprocess.check_call(['tput', 'lines']))
        return (cols, rows)
    except Exception:
        return None

def _ioctl_GWINSZ(fd):
    yx = Struct("hh")
    try:
        import fcntl
        import termios
        return yx.unpack(fcntl.ioctl(fd, termios.TIOCGWINSZ, '1234'))
    except Exception:
        return None

def _get_terminal_size_linux():
    cr = _ioctl_GWINSZ(0) or _ioctl_GWINSZ(1) or _ioctl_GWINSZ(2)
    if not cr:
        try:
            fd = os.open(os.ctermid(), os.O_RDONLY)
            cr = _ioctl_GWINSZ(fd)
            os.close(fd)
        except Exception:
            pass
    if not cr:
        try:
            cr = (int(os.environ['LINES']), int(os.environ['COLUMNS']))
        except Exception:
            return None
    return cr[1], cr[0]


