"Colour
"colorscheme vanzan_color
"colorscheme ir_black
syntax on

"Tab == 4 spaces
set softtabstop=4
set tabstop=4
set expandtab
set sw=4

"Syncronize svn update with oppened file
set autoread

"Break lines
set linebreak

" GVIM x VI
set nocompatible

"Indentation after for, while, etc
"set smartindent
"set autoindent

"Set plugin according to filetype
"filetype plugin on
"filetype plugin indent on
"filetype indent on

"Show intermediate search results
set incsearch

"General
set nu
set ruler

"Future testing
set smartcase

"Highlight
match ErrorMsg '\%>70v.\+'

" file encoding
set fileencoding=utf-8

" nice statusline
set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [language=%Y]\ [position=%04v][%p%%]\ [lines=%L]\ [ascii=\%03.3b]\ [hex=\%02.2B]
set laststatus=2
set autoindent
set nobackup
set completeopt=menu
set autoread
set autoindent


" plugins

source $HOME/.vimplugins/comments.vim

" python
let python_highlight_numbers=1
let python_highlight_builtins=1
let python_highlight_exceptions=1
let python_highlight_space_errors=1
autocmd FileType python filetype indent on
autocmd FileType xml,xhtml source /usr/share/vim/vim71/indent/xml.vim

" wild completion :)
set wildmode=list:longest

" C, Javascript
autocmd FileType c,cpp,javascript setlocal cindent
autocmd FileType c,cpp,javascript setlocal ts=2
autocmd FileType c,cpp,javascript setlocal sw=2
autocmd FileType html,htmldjango setlocal textwidth=5000

" tab config
:nmap <C-T> :tabnew
map <C-Right> :tabnext<cr>
map <C-Left> :tabprevious<cr>
map <Tab> :tabnext<cr>
map <S-Tab> :tabprevious<cr>


" code folding
"autocmd FileType python set foldmethod=indent
"autocmd FileType python :%foldopen!
"autocmd BufNewFile,BufRead *.c,*.cpp set foldmethod=indent
"autocmd BufNewFile,BufRead *.c,*.cpp :%foldopen!

" adicao de tipos do zopao
autocmd BufNewFile,BufRead *.zcml         setf xml
autocmd BufNewFile,BufRead *.pt,*.[cj]pt, setf xhtml
autocmd BufNewFile,BufRead *.css.dtml     setf css
autocmd BufNewFile,BufRead *.js.dtml      setf javascript
autocmd BufNewFile,BufRead *.metadata     setf dosini

" tab para o make e ChangeLog
autocmd FileType changelog setlocal noet
autocmd FileType make setlocal noet

" Salvar a posicao do cursor em arquivos recem editados
autocmd BufRead *,.* :normal '"

" -- Templates --
" Funções releacionadas a templates de códigos.

function! LoadTemplate(template)
    let content = readfile($HOME . "/.vimplugins/templates/" . a:template)
    return content
endfunction

function! InsertPdb()
    execute "normal Iimport pdb; pdb.set_trace()"
endfunction

if exists(":Pdb") != 2
    command! -nargs=0 Pdb call InsertPdb()
endif

function! InsertTemplate(template)
    normal(1G)
    call append(0, LoadTemplate(a:template))
    echo "template" a:template "inserido com sucesso!"
    normal($)
endfunction

function! InsertGObjectBody(namespace,typename)
    let ns = a:namespace
    let type = a:typename
    :silent! exec 'tabnew '.namespace.'-'.typename.'.c'
    call append(0, LoadTemplate("gobject.c"))
    :silent! exec '%s/@ns@/\l'.ns.'/g'
    :silent! exec '%s/@Ns@/\u'.ns.'/g'
    :silent! exec '%s/@NS@/\U'.ns.'/g'
    :silent! exec '%s/@type@/\l'.type.'/g'
    :silent! exec '%s/@Type@/\u'.type.'/g'
    :silent! exec '%s/@TYPE@/\U'.type.'/g'
    :silent! setf c
endfunction

function! InsertGObjectHead(namespace, typename)
    let ns = a:namespace
    let type = a:typename
    :silent! exec 'tabnew '.namespace.'-'.typename.'.h'
    call append(0, LoadTemplate("gobject.h"))
    :silent! exec '%s/@ns@/\l'.ns.'/g'
    :silent! exec '%s/@Ns@/\u'.ns.'/g'
    :silent! exec '%s/@NS@/\U'.ns.'/g'
    :silent! exec '%s/@type@/\l'.type.'/g'
    :silent! exec '%s/@Type@/\u'.type.'/g'
    :silent! exec '%s/@TYPE@/\U'.type.'/g'
    :silent! setf c
endfunction


function! GnuIndent()
    :silent! %!indent -gnu -nut
endfun

if exists(":InsertTemplate") != 2
    command! -nargs=1 InsertTemplate call InsertTemplate(<q-args>)
endif

if exists(":GObjectBody") != 2
    command! -nargs=* InsertGObjectBody call InsertGObjectBody(<f-args>)
endif

if exists(":GObjectHead") != 2
    command! -nargs=* InsertGObjectHead call InsertGObjectHead(<f-args>)
endif

if exists(":GnuIndent") != 2
    command! GnuIndent call GnuIndent()
endif

if exists(":PythonLicense") != 2
    command! PythonLicense call InsertTemplate("pylicense")
endif

if exists(":CLicense") != 2
    command! CLicense call InsertTemplate("clicense")
endif

map <C-p> :call InsertPdb()<cr>
vmap <C-p> :call InsertPdb()<cr>

" permite recarregar o vim para que as modificacoes no .vimrc sejam ativadas
nmap <F12> :<C-u>source $HOME/.vimrc <BAR> echo "Vimrc recarregado!"<CR>

autocmd FileType html set textwidth=500
autocmd FileType javascript set textwidth=500

function! HtmlEscape()
    :silent! s/ /&nbsp;/g
    :silent! s/¡/&iexcl;/g
    :silent! s/¢/&cent;/g
    :silent! s/£/&pound;/g
    :silent! s/¤/&curren;/g
    :silent! s/¥/&yen;/g
    :silent! s/¦/&brvbar;/g
    :silent! s/§/&sect;/g
    :silent! s/¨/&uml;/g
    :silent! s/©/&copy;/g
    :silent! s/ª/&ordf;/g
    :silent! s/«/&laquo;/g
    :silent! s/¬/&not;/g
    :silent! s/­/&shy;/g
    :silent! s/®/&reg;/g
    :silent! s/¯/&macr;/g
    :silent! s/°/&deg;/g
    :silent! s/±/&plusmn;/g
    :silent! s/²/&sup2;/g
    :silent! s/³/&sup3;/g
    :silent! s/´/&acute;/g
    :silent! s/µ/&micro;/g
    :silent! s/¶/&para;/g
    :silent! s/·/&middot;/g
    :silent! s/¸/&cedil;/g
    :silent! s/¹/&sup1;/g
    :silent! s/º/&ordm;/g
    :silent! s/»/&raquo;/g
    :silent! s/¼/&frac14;/g
    :silent! s/½/&frac12;/g
    :silent! s/¾/&frac34;/g
    :silent! s/¿/&iquest;/g
    :silent! s/À/&Agrave;/g
    :silent! s/Á/&Aacute;/g
    :silent! s/Â/&Acirc;/g
    :silent! s/Ã/&Atilde;/g
    :silent! s/Ä/&Auml;/g
    :silent! s/Å/&Aring;/g
    :silent! s/Æ/&AElig;/g
    :silent! s/Ç/&Ccedil;/g
    :silent! s/È/&Egrave;/g
    :silent! s/É/&Eacute;/g
    :silent! s/Ê/&Ecirc;/g
    :silent! s/Ë/&Euml;/g
    :silent! s/Ì/&Igrave;/g
    :silent! s/Í/&Iacute;/g
    :silent! s/Î/&Icirc;/g
    :silent! s/Ï/&Iuml;/g
    :silent! s/Ð/&ETH;/g
    :silent! s/Ñ/&Ntilde;/g
    :silent! s/Ò/&Ograve;/g
    :silent! s/Ó/&Oacute;/g
    :silent! s/Ô/&Ocirc;/g
    :silent! s/Õ/&Otilde;/g
    :silent! s/Ö/&Ouml;/g
    :silent! s/×/&times;/g
    :silent! s/Ø/&Oslash;/g
    :silent! s/Ù/&Ugrave;/g
    :silent! s/Ú/&Uacute;/g
    :silent! s/Û/&Ucirc;/g
    :silent! s/Ü/&Uuml;/g
    :silent! s/Ý/&Yacute;/g
    :silent! s/Þ/&THORN;/g
    :silent! s/ß/&szlig;/g
    :silent! s/à/&agrave;/g
    :silent! s/á/&aacute;/g
    :silent! s/â/&acirc;/g
    :silent! s/ã/&atilde;/g
    :silent! s/ä/&auml;/g
    :silent! s/å/&aring;/g
    :silent! s/æ/&aelig;/g
    :silent! s/ç/&ccedil;/g
    :silent! s/è/&egrave;/g
    :silent! s/é/&eacute;/g
    :silent! s/ê/&ecirc;/g
    :silent! s/ë/&euml;/g
    :silent! s/ì/&igrave;/g
    :silent! s/í/&iacute;/g
    :silent! s/î/&icirc;/g
    :silent! s/ï/&iuml;/g
    :silent! s/ð/&eth;/g
    :silent! s/ñ/&ntilde;/g
    :silent! s/ò/&ograve;/g
    :silent! s/ó/&oacute;/g
    :silent! s/ô/&ocirc;/g
    :silent! s/õ/&otilde;/g
    :silent! s/ö/&ouml;/g
    :silent! s/÷/&divide;/g
    :silent! s/ø/&oslash;/g
    :silent! s/ù/&ugrave;/g
    :silent! s/ú/&uacute;/g
    :silent! s/û/&ucirc;/g
    :silent! s/ü/&uuml;/g
    :silent! s/ý/&yacute;/g
    :silent! s/þ/&thorn;/g
    :silent! s/ÿ/&yuml;/g
    :silent! s/\"/&quot;/g
    :silent! s/\'/&#39;/g
    :silent! s/</&lt;/g
    :silent! s/>/&gt;/g
    :silent! s/&/&amp;/g
endfun

function! HtmlUnEscape()
    :silent! s/\&nbsp/ /g
    :silent! s/\&iexcl/¡/g
    :silent! s/\&cent/¢/g
    :silent! s/\&pound/£/g
    :silent! s/\&curren/¤/g
    :silent! s/\&yen/¥/g
    :silent! s/\&brvbar/¦/g
    :silent! s/\&sect/§/g
    :silent! s/\&uml/¨/g
    :silent! s/\&copy/©/g
    :silent! s/\&ordf/ª/g
    :silent! s/\&laquo/«/g
    :silent! s/\&not/¬/g
    :silent! s/\&shy/­/g
    :silent! s/\&reg/®/g
    :silent! s/\&macr/¯/g
    :silent! s/\&deg/°/g
    :silent! s/\&plusmn/±/g
    :silent! s/\&sup2/²/g
    :silent! s/\&sup3/³/g
    :silent! s/\&acute/´/g
    :silent! s/\&micro/µ/g
    :silent! s/\&para/¶/g
    :silent! s/\&middot/·/g
    :silent! s/\&cedil/¸/g
    :silent! s/\&sup1/¹/g
    :silent! s/\&ordm/º/g
    :silent! s/\&raquo/»/g
    :silent! s/\&frac14/¼/g
    :silent! s/\&frac12/½/g
    :silent! s/\&frac34/¾/g
    :silent! s/\&iquest/¿/g
    :silent! s/\&Agrave/À/g
    :silent! s/\&Aacute/Á/g
    :silent! s/\&Acirc/Â/g
    :silent! s/\&Atilde/Ã/g
    :silent! s/\&Auml/Ä/g
    :silent! s/\&Aring/Å/g
    :silent! s/\&AElig/Æ/g
    :silent! s/\&Ccedil/Ç/g
    :silent! s/\&Egrave/È/g
    :silent! s/\&Eacute/É/g
    :silent! s/\&Ecirc/Ê/g
    :silent! s/\&Euml/Ë/g
    :silent! s/\&Igrave/Ì/g
    :silent! s/\&Iacute/Í/g
    :silent! s/\&Icirc/Î/g
    :silent! s/\&Iuml/Ï/g
    :silent! s/\&ETH/Ð/g
    :silent! s/\&Ntilde/Ñ/g
    :silent! s/\&Ograve/Ò/g
    :silent! s/\&Oacute/Ó/g
    :silent! s/\&Ocirc/Ô/g
    :silent! s/\&Otilde/Õ/g
    :silent! s/\&Ouml/Ö/g
    :silent! s/\&time:silent! s/×/g
    :silent! s/\&Oslash/Ø/g
    :silent! s/\&Ugrave/Ù/g
    :silent! s/\&Uacute/Ú/g
    :silent! s/\&Ucirc/Û/g
    :silent! s/\&Uuml/Ü/g
    :silent! s/\&Yacute/Ý/g
    :silent! s/\&THORN/Þ/g
    :silent! s/\&szlig/ß/g
    :silent! s/\&agrave/à/g
    :silent! s/\&aacute/á/g
    :silent! s/\&acirc/â/g
    :silent! s/\&atilde/ã/g
    :silent! s/\&auml/ä/g
    :silent! s/\&aring/å/g
    :silent! s/\&aelig/æ/g
    :silent! s/\&ccedil/ç/g
    :silent! s/\&egrave/è/g
    :silent! s/\&eacute/é/g
    :silent! s/\&ecirc/ê/g
    :silent! s/\&euml/ë/g
    :silent! s/\&igrave/ì/g
    :silent! s/\&iacute/í/g
    :silent! s/\&icirc/î/g
    :silent! s/\&iuml/ï/g
    :silent! s/\&eth/ð/g
    :silent! s/\&ntilde/ñ/g
    :silent! s/\&ograve/ò/g
    :silent! s/\&oacute/ó/g
    :silent! s/\&ocirc/ô/g
    :silent! s/\&otilde/õ/g
    :silent! s/\&ouml/ö/g
    :silent! s/\&divide/÷/g
    :silent! s/\&oslash/ø/g
    :silent! s/\&ugrave/ù/g
    :silent! s/\&uacute/ú/g
    :silent! s/\&ucirc/û/g
    :silent! s/\&uuml/ü/g
    :silent! s/\&yacute/ý/g
    :silent! s/\&thorn/þ/g
    :silent! s/\&yuml/ÿ/g
    :silent! s/\&quot/\"/g
    :silent! s/\&lt/</g
    :silent! s/\&gt/>/g
    :silent! s/\&amp/\'/g

endfun

"nmap <C-y> :call HtmlEscape()<cr>
"nmap <C-u> :call HtmlUnEscape()<cr>

" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END
