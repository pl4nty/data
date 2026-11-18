-- Threat: !InfrastructureShared
-- Name: 28899034350f
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 96)
local l_0_1 = string.find(l_0_0, "t\002\235", 1, true) - 1
local l_0_2 = string.find(l_0_0, "t\002\235", l_0_1 + 4, true) - 1
if l_0_1 ~= nil and l_0_2 ~= nil then
  pe.mmap_patch_va(pevars.sigaddr + l_0_1, "\235")
  pe.mmap_patch_va(pevars.sigaddr + l_0_2, "\235")
end
return mp.LOWFI
