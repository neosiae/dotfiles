function fish_prompt -d "Write out the prompt"
  set_color blue 
  printf '\n[%s]' (basename $PWD)

  set_color red 
  printf ' %s' (git_branch_name)
  
  set_color $fish_color_cwd 
  printf '\n%s~$ ' (whoami)

  set_color normal
end
