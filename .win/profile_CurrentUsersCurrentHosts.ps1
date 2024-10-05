Set-Alias touch New-Item
function gs {git status}
function gadd() {git add $args}
function gcom {git commit}
function gpsh {git push}
function glog {git log --all --oneline --graph}
function which() {(Get-Command $args).Path}
function prompt {'PS ' + $(split-path . -Leaf) + '> '}
