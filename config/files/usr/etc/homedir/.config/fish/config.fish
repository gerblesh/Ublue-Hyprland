if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
# blank fish greeting
end

alias mpv="flatpak run io.mpv.Mpv"
alias ls="exa --icons --sort type"
alias just="just --unstable -f $HOME/.config/just/justfile"
set PATH "$HOME"/.local/bin:$PATH

