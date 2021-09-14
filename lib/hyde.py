import os
import subprocess

def render_hyde_template(path):
    return execute_hyde_file(path)

def execute_hyde_file(path):
    return subprocess.check_output(f"hyde {path}", shell=True)

def execute_hyde_code(code):
    tmp_path = 'tmp/tmp_hyde_executable.hy'

    with open(tmp_path, 'w') as hyde_file:
        hyde_file.write(code)

    result = execute_hyde_file(tmp_path)

    if os.path.exists(tmp_path):
        os.remove(tmp_path)

    return result