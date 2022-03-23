" Description: Keymaps

let mapleader = (' ')

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
" Delete single characted without yank
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
"Open Explorer
nmap <Leader>e :E<CR>

" Tabs
" Open current directory
nmap te :tabedit 
nmap <C-t>      :Texplore<CR> 
nmap <S-Tab>    :tabprev<Return>
nmap <Tab>      :tabnext<Return>

"------------------------------
" Windows
" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l

" Capital Y to Yank til the end of the line
nnoremap Y yg$

" Keep the next search centered
nnoremap n nzzzv
nnoremap N Nzzzv

"------------------------------
" Undo break points
inoremap . .<C-g>u
inoremap , ,<C-g>u
inoremap ( (<C-g>u
inoremap " "<C-g>u

"------------------------------
" Moving text
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
