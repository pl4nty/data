-- Threat: !InfrastructureShared
-- Name: 38959b0a5aa3
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 16, 96)
local l_0_1 = string.byte(l_0_0, 1) + 2
if l_0_1 > #l_0_0 then
  return mp.CLEAN
end
if string.byte(l_0_0, l_0_1) == 232 then
  return mp.INFECTED
end
return mp.CLEAN
