-- Threat: !InfrastructureShared
-- Name: 2889c2d1a51e
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr - 4, 21)
local l_0_1 = string.byte(l_0_0, 2)
if l_0_1 ~= string.byte(l_0_0, 11) then
  return mp.CLEAN
end
pe.set_regval(pe.REG_EAX, l_0_1)
pe.mmap_patch_va(pevars.sigaddr, "\144\144\144\144\144")
return mp.INFECTED
