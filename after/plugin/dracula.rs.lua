local status, dracula = pcall(require, 'dracula')

if (not status) then return end

dracula.setup {
  soft = true,
  transparent = false,
  saturation = {
    enabled = false,
    amount = 10,
  }
}
