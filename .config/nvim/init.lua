
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Make word wrap easier
vim.keymap.set('n', 'j', 'gj') 
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', 'k', 'gk')
vim.cmd(":set whichwrap+=lh")
--- Get rid of overtype mode, replace it with 'delete one character and insert'
vim.keymap.set('n', 'R', '"_cl')
-- Insert a newline with leader enter.  Had to add leader because I needed enter to follow links or something?
vim.keymap.set('n', '<leader><cr>', ":call append(line('.'), '')<cr>")
-- vim.keymap.set('n', '<leader><cr>', ":call insert(line('.'), '')<cr>", { desc = 'insert blank line above'}) -- ABC TODO what to map this to?  I'd like shift+Enter, and I could hack that to work with Windows Terminal, but I'd prefer not to rely on any terminal specific implementation.  Maybe <leader><CR>?
-- This one didn't work so i guess just copy from the nvim source for [<space>
-- vim.keymap.set('n', '<leader><cr>', function()
--       vim.go.operatorfunc = "v:lua.require'vim._buf'.space_above"
--       return 'g@l'
--     end, { expr = true, desc = 'insert blank line above'})

-- x uses the black hole register
vim.keymap.set('n', 'x', '"_x') -- ABC TODO what about in visual mode?  Maybe keep it there
-- Do the same with c (normal and visual)
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('v', 'c', '"_c')
-- don't overwrite the unnamed register when pasting in visual mode
vim.keymap.set('v', 'p', 'P')

vim.o.background = "dark" -- or "light" for light mode
vim.opt.foldmethod = "indent"


vim.o.foldlevel = 9
vim.opt.foldtext = "" -- abc todo put a triangle here too?
-- ABC TODO NOW https://www.reddit.com/r/neovim/comments/1nxzz9i/new_foldinner_fillchar/
-- ABC TODO NOW if I update to the main branch nightly build, I can set foldcolumn to 1 and set fillchars=foldinner:\|
vim.o.foldcolumn = '1'
vim.o.foldlevelstart = 9
-- vim.wo.foldtext = '' -- abc todo what's wo instead of o?
vim.opt.fillchars = {
    fold = ' ',
    foldclose = "",--'',
    foldopen = "",--'',
    foldsep = ' ',
    foldinner = ' '
}

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true
vim.keymap.set('n', '<leader>zl', ':set invrelativenumber<cr>', { desc = 'toggle relative line numbers'})

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.o.mouse = 'a'
vim.o.mouse = ''
vim.keymap.set('n', '<leader>zmn', ':set mouse=<cr>', { desc = 'mouse off'})
vim.keymap.set('n', '<leader>zma', ':set mouse=a<cr>', { desc = 'mouse on'})

vim.keymap.set('n', '<leader>zw', ':set invwrap<cr>', { desc = 'toggle line wrap'})
vim.o.linebreak = true  -- word wrap

-- Don't show the mode, since it's already in the status line
-- vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.o.clipboard = 'unnamedplus'
-- end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', space = '·', nbsp = '␣' }
vim.keymap.set('n', '<leader>z<leader>', ':set invlist<cr>', { desc = 'toggle whitespace chars'})
vim.keymap.set('n', '<leader>zh', ':set invlist<cr>', { desc = 'toggle whitespace chars'})

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})




vim.keymap.set('n', '<leader>Sw', ':lua MiniSessions.write("Session.vim")<cr>', { desc = 'Write Session'})
vim.keymap.set('n', '<leader>Sr', ':lua MiniSessions.read()<cr>', { desc = 'Read Session'})

vim.cmd('badd ~/.config/nvim/init.lua') -- add this to the open buffers so I can jump to it from any file
vim.cmd('badd ~/Documents/spellbooks/nvim.txt') -- add this to the open buffers so I can jump to it from any file

-- *gui-colors*
-- Suggested color names (these are available on most systems):
--     Red		LightRed	DarkRed
--     Green	LightGreen	DarkGreen	SeaGreen
--     Blue	LightBlue	DarkBlue	SlateBlue
--     Cyan	LightCyan	DarkCyan
--     Magenta	LightMagenta	DarkMagenta
--     Yellow	LightYellow	Brown		DarkYellow
--     Gray	LightGray	DarkGray
--     Black	White
--     Orange	Purple		Violet
--
-- Colors which define Nvim's default color scheme:
--     NvimDarkBlue    NvimLightBlue
--     NvimDarkCyan    NvimLightCyan
--     NvimDarkGray1   NvimLightGray1
--     NvimDarkGray2   NvimLightGray2
--     NvimDarkGray3   NvimLightGray3
--     NvimDarkGray4   NvimLightGray4
--     NvimDarkGreen   NvimLightGreen
--     NvimDarkMagenta NvimLightMagenta
--     NvimDarkRed     NvimLightRed
--     NvimDarkYellow  NvimLightYellow
--




-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- 

