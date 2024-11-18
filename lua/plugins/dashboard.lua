return { -- DONE
  enabled = false,
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


    logo = string.rep("\n", 1) .. logo .. ""

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
            { action = "enew | startinsert", desc = " New File", key = "n"},
            { action = "bdelete | so session.vim", desc = " Load Session", key = "s"},
            { action = "Telescope find_files ", desc = " Find Files", key = "f"},
            { action = "Telescope colorscheme ", desc = " Colorscheme", key = "c"},
            { action = "Telescope oldfiles ", desc = " Recent Files", key = "r"},
            { action = "Lazy", desc = " Lazy", key = "l"},
            { action = "q", desc = " Quit", key = "q"},
        },
        -- footer = {},
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local msg_str = "Startuptime: " .. ms .. " ms"
          local msg_plugs =  "Plugins: " .. stats.loaded .. " loaded / " .. stats.count .. " installed" 
          return { msg_str, msg_plugs }
        end,
      },
    }
    return opts
  end,
	config = function(_, opts)
	  require("dashboard").setup(opts)
	end,
}
