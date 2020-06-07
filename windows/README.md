# Windows setup

## Terminal setup

1. Install [Windows Substystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) (WSL)
2. Install zsh: `sudo apt-get install zsh`
3. Set zsh as the default prompt: 
```bash
if test -t 1; then
exec zsh
fi
```
4. Install antibody: `curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin`
5. Setup your plugins in `~/.zsh_plugins.txt`
6. Create the antibody bundle: `antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh`

## Keyboard setup

1. Install [SharpKeys](https://www.randyrants.com/category/sharpkeys/) and load the [sharpkeys-config.skl](./sharpkeys-config.skl) to map the modifier keys at the registry level. Then press "Write to Registry" and logout. 
2. Install [AutoHotkey]((https://www.autohotkey.com), run the [autohotkey-config.ahk](./autohotkey-config.ahk), and [make it start automatically](https://www.autohotkey.com/docs/FAQ.htm#Startup).
