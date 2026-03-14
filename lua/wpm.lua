local Wpm = {}

function Wpm.setup(config)
	if config ~= nil and config.label ~= nil then
		WpmLabel = config.label
	end

	vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		CharCount = 0
		StartTime = vim.uv.now()
	end
	})
	vim.api.nvim_create_autocmd("InsertCharPre", {
	callback = function()
		CharCount = CharCount + 1
	end
	})
	vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		EndTime = vim.uv.now()
		if EndTime-StartTime ~= 0 then
			print(math.floor(CharCount/5 / ((EndTime-StartTime)/1000/60)) .. WpmLabel)
		end
	end
	})
end

return Wpm
