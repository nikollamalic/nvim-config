local status, autotag = pcall(require, 'nvim-ts-auto')
if not(status) then return end

autotag.setup {}
