local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load('user.lazy')
load('user.settings')
load('user.commands')
load('user.keymaps')
load('user.lsp')
