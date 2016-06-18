function! githubprreview#GithubPR(owner,repo,pr)
    call githubprreview#SetupPyImports()
    :py from githubprreview import pull_request
    :py pull_request.start_review("a:owner", "a:repo", "a:pr")
endfunction

function! githubprreview#SetupPyImports()
python << endpython

import os
import sys
import vim

python_plugin_path_loaded = int(vim.eval('exists("g:githubprreview_plugin_path_loaded")'))

if python_plugin_path_loaded == 0:
    vim.command("let g:githubprreview_plugin_path_loaded=1")

    plugin_path = vim.eval("g:githubprreview_plugin_path")
    python_plugin_path = '%s/../lib' % (plugin_path)
    sys.path.append(os.path.abspath(python_plugin_path))

endpython
endfunction
