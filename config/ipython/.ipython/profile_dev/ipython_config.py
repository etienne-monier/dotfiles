# Get initial config
c = get_config()

# Add personal codes.
c.InteractiveShellApp.exec_lines = [
    'import sys; sys.path.append("/home/etienne/.mypython3")'
]

# Add autoreload extension.
c.InteractiveShellApp.extensions = [
    'autoreload'
]
# c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines.append('%autoreload 2')
c.InteractiveShellApp.exec_lines.append('print("Warning: autoreload has been enabled.")')

# Add matplotlib qt option
c.InteractiveShellApp.exec_lines.append('%matplotlib qt')

# Automaticly load numpy and scipy
c.InteractiveShellApp.exec_lines.append('import numpy as np')
c.InteractiveShellApp.exec_lines.append('import matplotlib.pyplot as plt')
c.InteractiveShellApp.exec_lines.append('print("Warning: numpy (np) and matplotlib.pyplot (plt) have been imported.")')

# Load line profiling
c.InteractiveShellApp.extensions.append('line_profiler')

# Automatically invoke %debug when exception raises
c.InteractiveShell.pdb = True 

# last warning
c.InteractiveShellApp.exec_lines.append('print("Warning: To improve performances, use the default profile by using ''ipython --profile=default''.")')

