-- Threat: !InfrastructureShared
-- Name: 4f89f5df91bf
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 2, 4)
local l_0_1 = string.byte(l_0_0, 1) + string.byte(l_0_0, 2) * 256 + string.byte(l_0_0, 3) * 65536 + string.byte(l_0_0, 4) * 16777216
local l_0_2 = pe.mmap_va(l_0_1, 7)
if l_0_2 == "%x.exe\000" then
  return mp.INFECTED
end
return mp.CLEAN
