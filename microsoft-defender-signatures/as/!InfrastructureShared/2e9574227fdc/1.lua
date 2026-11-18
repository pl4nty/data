-- Threat: !InfrastructureShared
-- Name: 2e9574227fdc
-- Type: 21

mp.readprotection(false)
local l_0_0 = pe.mmap_va(pevars.sigaddr, 100)
local l_0_1 = string.find(l_0_0, "Yt", 1, true)
local l_0_2 = string.find(l_0_0, "\015\132", 1, true)
if l_0_2 ~= nil and l_0_1 ~= nil then
  if l_0_1 <= l_0_2 then
    local l_0_3 = string.byte(l_0_0, l_0_2 + 2)
    local l_0_4 = string.char(l_0_2 - l_0_1 + l_0_3)
    pe.mmap_patch_va(pevars.sigaddr + l_0_1, string.format("\233%s\000\000\000", l_0_4))
  else
    pe.mmap_patch_va(pevars.sigaddr + l_0_2 - 1, "\144\233")
  end
end
return mp.LOWFI
