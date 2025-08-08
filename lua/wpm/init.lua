local M = {} -- M stands for module, a naming convention


function M.setup()
	CharCount = 0
	Timer = 0
	StartTime = os.clock()

end

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    -- Your plugin logic here
    --print("Entered Insert Mode!")
	CharCount = 0
	StartTime = os.time();
	Timer = os.time()-StartTime
    -- For example, you could set a global variable to track the mode
    -- vim.g.my_plugin_in_insert_mode = true
  end,
  desc = "Startup wpm moment",
})

vim.api.nvim_create_autocmd("InsertCharPre", {
  callback = function()
    -- Your plugin logic here
    --print("Enprinttered Insert Mode!")
	CharCount = CharCount + 1
    -- For example, you could set a global variable to track the mode
    -- vim.g.my_plugin_in_insert_mode = true
  end,
  desc = "Startup wpm moment",
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    -- Your plugin logic here
    --print("Enprinttered Insert Mode!")
	Timer = os.time()-StartTime
	print(math.floor(CharCount/5 / (Timer/60)) .. " WPM")
    -- For example, you could set a global variable to track the mode
    -- vim.g.my_plugin_in_insert_mode = true
  end,
  desc = "Startup wpm moment",
})

return M
