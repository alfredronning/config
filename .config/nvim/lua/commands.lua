vim.api.nvim_create_user_command("Main", ':normal! iif __name__ == "__main__":<ESC>', {})
vim.api.nvim_create_user_command("Open", ':normal! aopen("").read().strip().split("\\n")<ESC>9b2l', {})
vim.api.nvim_create_user_command("Gcc", '!gcc % && ./a.out', {})

