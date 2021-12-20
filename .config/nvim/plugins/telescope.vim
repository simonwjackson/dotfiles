" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope.nvim'

lua << EOF local actions = require('telescope.actions')

require('telescope').setup{
defaults = {
    mappings = {
        i = {
            ["<esc>"] = actions.close
            },
        },
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    layout_config = {
        horizontal = {
            mirror = false,
            },
        vertical = {
            mirror = true,
            },
        },
    },
pickers = {
    -- Your special builtin config goes in here
    buffers = {
        sort_lastused = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
            i = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
                -- Right hand side can also be the name of the action as a string
                ["<c-d>"] = "delete_buffer",
                },
            n = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
    find_files = {
        theme = "dropdown"
        },
    },
}

require('telescope').load_extension('coc')

--require('auto-session').setup {
--auto_session_enable_last_session=true,
--    }

require("todo-comments").setup {
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
            },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        }
    }

require("trouble").setup {}

EOF
