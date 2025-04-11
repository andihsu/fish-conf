if status is-interactive
    function fish_prompt
        set -l last_status $status
        # Prompt status only if it's not 0
        set -l stat

        if test $last_status -ne 0
            set stat (set_color red)"[$last_status]"(set_color normal)
        end
        if fish_is_root_user
            string join '' -- "" (set_color yellow)(prompt_pwd --full-length-dirs 3)$PWD (set_color red)$stat (set_color green)' #'
        else
            string join '' -- (set_color blue)'[' (date '+%m/%d/%y') ']'
            string join '' -- "" (set_color yellow)(prompt_pwd --full-length-dirs 3)$PWD (set_color red)$stat (set_color green)' >'
        end
    end

    function fish_right_prompt -d "Write out the right prompt"
        date -u
    end
end
