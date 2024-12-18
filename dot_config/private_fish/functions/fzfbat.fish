function fzfbat --wraps='fzf --preview "bat --color=always --style=numbers --line-range=:100 {}"' --description 'alias fzfbat fzf --preview "bat --color=always --style=numbers --line-range=:100 {}"'
  fzf --preview "bat --color=always --style=numbers --line-range=:100 {}" $argv
        
end
