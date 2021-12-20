" Vim motions on speed!
Plug 'easymotion/vim-easymotion'

" This setting makes EasyMotion work similarly to Vim's smartcase option for global searches.
let g:EasyMotion_smartcase = 1

" Don't map easymotion defaults
let g:EasyMotion_do_mapping = 0

" Don't interfere with Coc
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

" Easymotion keys
let g:EasyMotion_keys = 'fjdksla;ghrueiwoqpvmcnxbz''tyqp,.'

" keep cursor column when JK motion
let g:EasyMotion_startofline = 0 



" Movement
vmap j <Plug>(easymotion-j)
vmap k <Plug>(easymotion-k)

" Jumping
nmap <silent> s <Plug>(easymotion-s2)
xmap <silent> s <Plug>(easymotion-s2)
omap <silent> s <Plug>(easymotion-s2)
vmap <silent> s <Plug>(easymotion-s2)
