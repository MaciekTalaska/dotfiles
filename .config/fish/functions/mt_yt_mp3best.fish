function mt_yt_mp3best
	~/.local/bin/youtube-dl -f 'bestaudio' -x --audio-format mp3 --audio-quality 0 -o '%(title)s.f%(format_id)s.%(ext)s' $argv
end
