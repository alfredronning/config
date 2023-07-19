vim.g.mapleader = " "

local function set(mode, key, f)
    vim.keymap.set(mode, key, f)
end

set("n", "<leader>pv", vim.cmd.Ex)

-- move lines in visual mode
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- set cursor middle after commands
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- delete text to void
set("x", "<leader>p", [["_dP]])
set({"n", "v"}, "<leader>d", [["_d]])

-- yank to clipboard
set({"n", "v"}, "<leader>y", [["+y]])

set("n", "Q", "<nop>")
set("n", "<leader>f", vim.lsp.buf.format)

