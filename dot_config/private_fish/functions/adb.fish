function adb --description 'alias adb=HOME="$XDG_DATA_HOME"/android adb'
    HOME="$XDG_DATA_HOME"/android command adb $argv

end
