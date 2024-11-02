return { -- DONE
  enabled = true,
	"nvimdev/dashboard-nvim",
  -- requires = {'nvim-tree/nvim-web-devicons'}
  lazy = false,
  event = "VimEnter",
  opts = function()
    local logo2 = [[
           ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
           ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
           ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
           ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
           ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
           ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
      ]]



    local logo = [[
              ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗               
              ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║               
              ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║               
              ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║               
              ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║               
              ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝         v0.10.2
      ]]


    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
            { action = "enew | startinsert", desc = " New File", key = "n"},
            { action = "Telescope find_files ", desc = " Find Files", key = "f"},
            { action = "Telescope colorscheme ", desc = " Colorscheme", key = "c"},
            { action = "Telescope oldfiles ", desc = " Recent Files", key = "r"},
            { action = "Lazy", desc = " Lazy", key = "l"},
            { action = "q", desc = " Quit", key = "q"},
        },
      },
    }
    return opts
  end,
	config = function(_, opts)
	  require("dashboard").setup(opts)
	end,
}
