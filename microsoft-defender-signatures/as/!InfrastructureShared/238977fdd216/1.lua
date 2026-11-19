-- Threat: !InfrastructureShared
-- Name: 238977fdd216
-- Type: 21

local l_0_0 = string.byte(pe.mmap_va(pevars.sigaddr + 2, 1))
local l_0_1 = mp.readu_u32(pe.mmap_va(pevars.sigaddr + 4, 4), 1)
if l_0_0 + l_0_1 == 1623 or l_0_1 - l_0_0 == 1623 then
  return mp.INFECTED
end
return mp.CLEAN
