set -U fish_user_paths ~/sdk/node/bin $fish_user_paths
set -U fish_user_paths /opt/nvim/bin $fish_user_paths

function fish_prompt
    # force colour output for `chalk`
    set -x FORCE_COLOR 3

    # call node.js prompt with exit code
    ~/.config/fish/prompt "$status"
end

function vi -wrap=nvim --description 'Opens NeoVim instead of Vi, defaults to cwd'
    if count $argv > /dev/null
        nvim $argv
    else
        nvim .
    end
end

function ll -wraps=eza --description 'Overrides normal ll to use eza instead'
    exa --long --git --icons --group-directories-first --no-permissions --no-user --time-style long-iso -a
end

# pnpm
set -gx PNPM_HOME "/home/riastar/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
