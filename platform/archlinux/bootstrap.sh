sudo pacman --noconfirm --needed -S ack tmux vim mosh

source $DOTCONF/common/all.sh

DotconfSymlink "Xresources"
DotconfSymlink "Xresources.d"
DotconfSymlink "Xmodmap"
DotconfSymlink "xinitrc"

CloudDotfileSymlink "surf/bookmarks"

mkdir -p $HOME/.config
cat <<EOF > $HOME/.config/user-dirs.dirs
XDG_DESKTOP_DIR="/home/$USER/documents"
XDG_DOWNLOAD_DIR="/home/$USER/dl"
XDG_TEMPLATES_DIR="/home/$USER/documents/templates"
XDG_PUBLICSHARE_DIR="/home/$USER/documents/public"
XDG_DOCUMENTS_DIR="/home/$USER/documents"
XDG_MUSIC_DIR="/home/$USER/multimedia/music"
XDG_PICTURES_DIR="/home/$USER/multimedia/pictures"
XDG_VIDEOS_DIR="/home/$USER/multimedia/movies"
EOF

ARCHCONF=$DOTCONF/archlinux

CheckInstall "yaourt" || $ARCHCONF/get-yaourt.sh
