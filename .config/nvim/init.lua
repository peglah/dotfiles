local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load('config.lazy')
load('config.options')
load('config.autocmds')
load('config.keymaps')
load('config.lsp')

-- Install gcc, less, mingit, neovim, nodejs, ripgrep
-- Add ChatGPT API key to environment variable OPENAI_API_KEY
-- Add and point environment variable HOME to %USERPROFILE%
-- Download PowerShellEditorServices to nvim-data/mason/packages
-- Login to GitHub with :Copilot auth
