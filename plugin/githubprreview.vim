if exists('g:githubprreview_plugin_loaded') || &cp
  finish
endif
let g:githubprreview_plugin_loaded = 1

let g:githubprreview_plugin_path = expand('<sfile>:p:h')

command! -nargs=+ GithubPR call githubprreview#GithubPR(<f-args>)
