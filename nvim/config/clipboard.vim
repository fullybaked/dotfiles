if (has('clipboard'))
    if (has('unnamedplus')) " When possible use + register for copy-paste
        set clipboard=unnamedplus
    else " if not, use the * register for copy-paste
        set clipboard=unnamed
    endif
endif
