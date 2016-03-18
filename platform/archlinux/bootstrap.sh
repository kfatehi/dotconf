sudo pacman --needed -S ack tmux vim mosh

source $DOTCONF/common/all.sh

DotconfSymlink "Xresources"
DotconfSymlink "Xresources.d"

#mkdir -p $HOME/.config
#cat <<EOF > $HOME/.config/user-dirs.dirs
#XDG_DESKTOP_DIR="/home/$USER/"
#XDG_DOWNLOAD_DIR="/home/$USER/dl"
#XDG_TEMPLATES_DIR="/home/$USER/"
#XDG_PUBLICSHARE_DIR="/home/$USER/"
#XDG_DOCUMENTS_DIR="/home/$USER/media/docs"
#XDG_MUSIC_DIR="/home/$USER/media/music"
#XDG_PICTURES_DIR="/home/$USER/media/pictures"
#XDG_VIDEOS_DIR="/home/$USER/media/movies"
#EOF
#
