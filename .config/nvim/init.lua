--- Opções de interface
vim.o.number = true
vim.opt.termguicolors = false

--- Swapfile 
vim.opt.swapfile = true          
vim.opt.directory = os.getenv("HOME") .. "/.local/state/nvim/swap//"

--- Histórico de Desfazer Persistente 
vim.opt.undofile = true            
vim.opt.undolevels = 1000          
vim.opt.undoreload = 10000         

-- Organiza os arquivos de undo em uma pasta específica
local undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir

vim.opt.clipboard = "unnamedplus"

--- Mapeamentos
vim.keymap.set({"n", "v"}, "d", '"_d', { noremap = true })
vim.keymap.set({"n", "v"}, "x", '"_x', { noremap = true })
vim.keymap.set({"n", "v"}, "c", '"_c', { noremap = true })

vim.keymap.set({"n", "v"}, "D", '"_D', { noremap = true })
