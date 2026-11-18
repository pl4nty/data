-- Threat: !InfrastructureShared
-- Name: 45787a0ce0a6
-- Type: 21

local l_0_0 = pehdr.ImageBase + pesecs[1].VirtualAddress
local l_0_1 = pe.mmap_va(l_0_0, 4)
if string.sub(l_0_1, 1, 4) == "(re)" then
  mp.changedetectionname(805306418)
end
if mp.readu_u32(epcode, 1) == 1374456661 and mp.readu_u32(epcode, 5) == 3898037843 and mp.readu_u32(epcode, 13) == 4278738315 and mp.readu_u32(epcode, 17) == 1703089267 and mp.readu_u16(epcode, 21) == 252 then
  mp.changedetectionname(805306418)
end
return mp.INFECTED
