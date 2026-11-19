-- Threat: !InfrastructureShared
-- Name: 518922ae885e
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.byte(l_0_0, 28) + string.byte(l_0_0, 29) * 256 + string.byte(l_0_0, 30) * 65536 + string.byte(l_0_0, 31) * 16777216
local l_0_2 = pevars.sigaddr + 31 + l_0_1
l_0_0 = pe.mmap_va(l_0_2 - 4, 32)
local l_0_3 = string.byte(l_0_0, 1) + string.byte(l_0_0, 2) * 256 + string.byte(l_0_0, 3) * 65536 + string.byte(l_0_0, 4) * 16777216
local l_0_4 = mp.bitand(l_0_2 + l_0_3, 4294967295)
if l_0_4 ~= pevars.sigaddr then
  return mp.CLEAN
end
mp.changedetectionname(805306375)
return mp.SUSPICIOUS
