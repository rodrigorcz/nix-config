_ : {
  programs.neovim = {
    extraConfig = 
      /* vim */

      ''
      " General
      set mouse=a                       
      set clipboard=unnamedplus         
      set completeopt=menu,menuone,noselect

      " Neovim UI
      set number                        
      set showmatch                     
      set splitright                     
      set splitbelow                    
      set ignorecase                   
      set smartcase                     
      set linebreak                     
      set termguicolors                
      set laststatus=3                  

      " Tabs
      set smarttab
      set expandtab                    
      set shiftwidth=2                   
      set tabstop=2                    
      set smartindent                  
      
      " Scroll
      nmap <C-j> <C-e>
      nmap <C-k> <C-y>


     '';

    extraLuaConfig =
      /* lua */
      ''
      
      '';

  };
}