#!/usr/bin/env bash

mkdir -p ~/.config/fcitx5/conf
mkdir -p ~/.local/share/fcitx5/rime/
mkdir -p ~/.local/share/fcitx5/themes/

git clone --depth=1 https://github.com/iDvel/rime-ice.git /tmp/rime-ice-temp
cp -rv /tmp/rime-ice-temp/* ~/.local/share/fcitx5/rime/
git clone https://github.com/thep0y/fcitx5-themes-candlelight.git /tmp/fcitx5-theme
cp -r /tmp/fcitx5-theme/* ~/.local/share/fcitx5/themes/
git clone https://github.com/catppuccin/fcitx5.git /tmp/fcitx5-theme-catppuccin
cp -r /tmp/fcitx5-theme-catppuccin/src/* ~/.local/share/fcitx5/themes

cat << EOF > ~/.local/share/fcitx5/rime/default.custom.yaml
patch:
  schema_list:
    - schema: rime_ice
  menu:
    page_size: 9

EOF

cat << EOF > ~/.config/fcitx5/conf/classicui.conf

Vertical Candidate List=False
WheelForPaging=True
Font="Sans Serif 20"
MenuFont="Sans Serif 20"
TrayFont="Sans Serif 20"
TrayOutlineColor=#000000
TrayTextColor=#ffffff
PreferTextIcon=False
ShowLayoutNameInIcon=True
UseInputMethodLanguageToDisplayText=True
Theme=catppuccin-mocha-maroon
DarkTheme=catppuccin-mocha-maroon
UseDarkTheme=False
UseAccentColor=True
PerScreenDPI=False
ForceWaylandDPI=0
EnableFractionalScale=True

EOF

cat << 'EOF' > ~/.fcitx5_env

export INPUT_METHOD=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx

EOF

grep -q fcitx5_env ~/.bashrc || echo 'source ~/.fcitx5_env' >> ~/.bashrc
grep -q fcitx5_env ~/.profile || echo 'source ~/.fcitx5_env' >> ~/.profile


PROFILE=~/.config/fcitx5/profile

if [ ! -f "$PROFILE" ]; then
cat << 'EOF' > "$PROFILE"
[Groups/0]
Name=Default
Default Layout=us
DefaultIM=rime

[Groups/0/Items/0]
Name=rime
Layout=
EOF
else
    grep -q "Name=rime" "$PROFILE" || cat << 'EOF' >> "$PROFILE"

[Groups/0/Items/999]
Name=rime
Layout=
EOF

    grep -q "^DefaultIM=rime" "$PROFILE" || \
        sed -i 's/^DefaultIM=.*/DefaultIM=rime/' "$PROFILE"
fi

fcitx5-remote -r
