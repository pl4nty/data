-- Threat: !InfrastructureShared
-- Name: 3d898df4b00c
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 32)
local l_0_1 = string.byte(l_0_0, 26) + string.byte(l_0_0, 27) * 256 + string.byte(l_0_0, 28) * 65536 + string.byte(l_0_0, 29) * 16777216
local l_0_2 = pevars.sigaddr + 29 + l_0_1
l_0_0 = pe.mmap_va(l_0_2 - 4, 32)
local l_0_3 = string.byte(l_0_0, 1) + string.byte(l_0_0, 2) * 256 + string.byte(l_0_0, 3) * 65536 + string.byte(l_0_0, 4) * 16777216
local l_0_4 = mp.bitand(l_0_2 + l_0_3, 4294967295)
if l_0_4 ~= pevars.sigaddr then
  return mp.CLEAN
end
if pehdr.SizeOfImage >= 503808 and pehdr.SizeOfImage <= 573440 or pehdr.SizeOfImage >= 409600 and pehdr.SizeOfImage <= 425984 or pehdr.SizeOfImage >= 868352 and pehdr.SizeOfImage <= 888832 then
  return mp.INFECTED
end
mp.changedetectionname(805306375)
return mp.SUSPICIOUS
