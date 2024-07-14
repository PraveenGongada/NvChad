local plugins = {
  {
    "williamboman/mason.nvim",
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    opts = {
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        -- "purescript-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "css-lsp",
        "prettierd"
      },
    },
  },
  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  -- DAP
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  --Golang
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter", -- load plugin after all configuration is set
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
   --    dashboard.section.header.val = {
			-- 	"                                                    ",
			-- 	" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			-- 	" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			-- 	" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			-- 	" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			-- 	" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			-- 	" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			-- 	"                                                    ",
			-- }
      -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = blue })
      -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = green, bg = blue })
      -- vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = green })
      --
      -- dashboard.section.header.val = {
      --   [[     █  █     ]],
      --   [[     ██ ██     ]],
      --   [[     █████     ]],
      --   [[     ██ ███     ]],
      --   [[     █  █     ]],
      --   [[]],
      --   [[N  E  O   V  I  M]],
      -- }
      --
      -- dashboard.section.header.opts.hl = {
      --   { { "NeovimDashboardLogo1", 6, 8 },  { "NeovimDashboardLogo3", 9, 22 } },
      --   { { "NeovimDashboardLogo1", 6, 8 },  { "NeovimDashboardLogo2", 9, 11 }, { "NeovimDashboardLogo3", 12, 24 } },
      --   { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 26 } },
      --   { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 24 } },
      --   { { "NeovimDashboardLogo1", 6, 11 }, { "NeovimDashboardLogo3", 12, 22 } },
      -- }
      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                             Praveen Kumar                             ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }
      _Gopts = {
        position = "center",
        hl = "Type",
      }
      -- way to add padding
      -- dashboard.opts.layout = {
      --   { type = "padding", val = 20 },
      --   dashboard.section.header
      -- }
      dashboard.section.buttons.val = {
        dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
        dashboard.button("b", "   File browser", ":NvimTreeFocus <CR>"),
        dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("w", "󰱼   Find word", ":Telescope live_grep<CR>"),
        dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
        -- dashboard.button("c", "   Config", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
        dashboard.button("m", "󱌣   Mason", ":Mason<CR>"),
        -- dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
        dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
      }
      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
      require('alpha').setup(dashboard.opts)
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          local stats = require('lazy').stats()
          local count = (math.floor(stats.startuptime * 100) / 100)
          dashboard.section.footer.val = {
            " ",
            " ",
            " ",
            "󱐌 " .. stats.count .. " plugins loaded in " .. count .. " ms",
          }
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    opts = function(_, opts)
      vim.opt.fillchars:append { diff = "╱" }
      opts.enhanced_diff_hl = true
    end,
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {
  --     timeout = 3000,
  --     background_color = #000000,
  --     render = "wrapped-compact",
  --   }
  -- },
  {
    "MunifTanjim/prettier.nvim",
      init = function ()
        require("prettier")
      end,
      bin = "prettierd",
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
        "lua",
      }
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
}
return plugins
