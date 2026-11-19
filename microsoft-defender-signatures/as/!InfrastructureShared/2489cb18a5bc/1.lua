-- Threat: !InfrastructureShared
-- Name: 2489cb18a5bc
-- Type: 21

local l_0_0 = string.byte(pe.mmap_va(pevars.sigaddr + 2, 1))
local l_0_1 = string.byte(pe.mmap_va(pevars.sigaddr + 5, 1))
if l_0_0 + l_0_1 == 87 or l_0_1 - l_0_0 == 87 then
  return mp.INFECTED
end
return mp.CLEAN
